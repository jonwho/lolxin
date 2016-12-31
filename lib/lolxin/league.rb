module Lolxin
  class LeagueError < StandardError; end

  class League
    BASE_ENDPOINT = "https://%s.api.pvp.net/api/lol/%s/%s/league"

    QUEUE_TYPES = %w[
      RANKED_FLEX_SR
      RANKED_FLEX_TT
      RANKED_SOLO_5x5
      RANKED_TEAM_3x3
      RANKED_TEAM_5x5
    ]

    attr_accessor :conn

    def initialize(options = {})
      region   = options[:region]
      version  = options[:version]
      api_key  = options[:api_key]
      endpoint = BASE_ENDPOINT % [region, region, version]
      @conn    = Faraday.new(endpoint, options[:conn_options]) do |faraday|
        faraday.request(:url_encoded)
        faraday.response(:logger)
        faraday.adapter(Faraday.default_adapter)
        faraday.params[:api_key] = api_key
      end
    end

    def by_summoner(params = {}, &block)
      summ_ids = params.delete(:summonerIds)
      if summ_ids.is_a? Array
        # Riot limits to 10 ids at a time
        summ_ids = summ_ids[0...10].join(',')
      end
      conn.get("by-summoner/#{summ_ids}", params, &block)
    end

    def by_summoner_entry(params = {}, &block)
      summ_ids = params.delete(:summonerIds)
      if summ_ids.is_a? Array
        # Riot limits to 10 ids at a time
        summ_ids = summ_ids[0...10].join(',')
      end
      conn.get("by-summoner/#{summ_ids}/entry", params, &block)
    end

    def challenger(params = {}, &block)
      raise(LeagueError, "Queue type given not in acceptable queue types #{QUEUE_TYPES}") unless QUEUE_TYPES.include? params[:type]
      conn.get('challenger', params, &block)
    end

    def master(params = {}, &block)
      raise(LeagueError, "Queue type given not in acceptable queue types #{QUEUE_TYPES}") unless QUEUE_TYPES.include? params[:type]
      conn.get('master', params, &block)
    end
  end
end
