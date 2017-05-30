module Lolxin
  class Match
    BASE_ENDPOINT = "https://%{region}.api.riotgames.com/lol/match/%{version}"

    attr_accessor :conn

    # TODO: many endpoints to change and many DTOs to add
    def initialize(options = {})
      region   = options[:region]
      api_key  = options[:api_key]
      version  = options[:version]
      endpoint = BASE_ENDPOINT % [region, region, version]
      @conn    = Faraday.new(endpoint, options[:conn_options]) do |faraday|
        faraday.request(:url_encoded)
        faraday.response(:logger)
        faraday.adapter(Faraday.default_adapter)
        faraday.params[:api_key] = api_key
      end
    end

    def by_id(match_id)
      endpoint = "matches/#{match_id}"
      conn.get(endpoint)
    end

    def by_account(account_id)
      endpoint = "matchlists/by-account/#{account_id}"
      conn.get(endpoint)
    end

    def by_account_recent(account_id)
      endpoint = "matchlists/by-account/#{account_id}/recent"
      conn.get(endpoint)
    end

    def timelines(match_id)
      endpoint = "timelines/by-match/#{match_id}"
      conn.get(endpoint)
    end

    def ids_by_tournament_code(t_code)
      endpoint = "matches/by-tournament-code/#{t_code}/ids"
      conn.get(endpoint)
    end

    def id_by_tournament_code(match_id, t_code)
      endpoint = "matches/#{match_id}/by-tournament-code/#{t_code}"
      conn.get(endpoint)
    end
  end
end
