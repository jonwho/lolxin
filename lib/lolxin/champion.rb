module Lolxin
  class Champion
    BASE_ENDPOINT = "https://%s.api.pvp.net/api/lol/%s/%s/champion"

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

    def champion(params = {}, &block)
      id = params.delete(:id).to_s
      conn.get(id, params, &block)
    end
  end
end
