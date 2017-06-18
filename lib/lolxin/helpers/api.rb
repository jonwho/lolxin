module Lolxin
  class Api
    BASE_ENDPOINT = "https://%{region}.api.riotgames.com/lol/"

    attr_accessor :api_key, :conn, :region, :version

    def initialize(options = {})
      @api_key  = options[:api_key]
      @region   = options[:region]
      @version  = options[:version]
      endpoint  = BASE_ENDPOINT % {region: region}
      @conn     = Faraday.new(endpoint, options[:conn_options]) do |faraday|
        faraday.request(:url_encoded)
        faraday.adapter(Faraday.default_adapter)
        faraday.params[:api_key] = api_key
      end
    end
  end
end
