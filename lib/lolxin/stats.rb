module Lolxin
  class Stats
    BASE_ENDPOINT = "https://%s.api.pvp.net/api/lol/%s/%s/stats/by-summoner"

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

    def ranked(params = {}, &block)
      summ_id = params.delete(:summonerId)
      conn.get("#{summ_id}/ranked", params, &block)
    end

    def summary(params = {}, &block)
      summ_id = params.delete(:summonerId)
      conn.get("#{summ_id}/summary", params, &block)
    end
  end
end
