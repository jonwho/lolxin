module Lolxin
  class FeaturedGames
    BASE_ENDPOINT = "https://%s.api.pvp.net/observer-mode/rest/featured"

    attr_accessor :conn

    def initialize(options = {})
      region   = options[:region]
      api_key  = options[:api_key]
      endpoint = BASE_ENDPOINT % [region]
      @conn    = Faraday.new(endpoint, options[:conn_options]) do |faraday|
        faraday.request(:url_encoded)
        faraday.response(:logger)
        faraday.adapter(Faraday.default_adapter)
        faraday.params[:api_key] = api_key
      end
    end

    def observe(params = {}, &block)
      conn.get("", params, &block)
    end
  end
end
