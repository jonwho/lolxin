module Lolxin
  class Match
    BASE_ENDPOINT = "https://%s.api.pvp.net/api/lol/%s/%s/match"

    attr_accessor :conn

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

    def match(params = {}, &block)
      match_id = params.delete(:matchId).to_s
      conn.get(match_id, params, &block)
    end
  end
end
