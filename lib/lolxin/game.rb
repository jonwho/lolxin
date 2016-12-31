module Lolxin
  class Game
    BASE_ENDPOINT = "https://%s.api.pvp.net/api/lol/%s/%s/game/by-summoner"

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

    def observe(params = {}, &block)
      summ_id = params.delete(:summonerId).to_s
      conn.get("#{summ_id}/recent", params, &block)
    end
  end
end
