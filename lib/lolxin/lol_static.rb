module Lolxin
  class LolStatic
    BASE_ENDPOINT = "https://global.api.pvp.net/api/lol/static-data/%s/%s"

    ENDPOINTS = %w[
      champion
      item
      language-strings
      languages
      map
      mastery
      realm
      rune
      summoner-spell
      versions
    ]

    attr_accessor :conn

    def initialize(options = {})
      region   = options[:region]
      version  = options[:version]
      api_key  = options[:api_key]
      endpoint = BASE_ENDPOINT % [region, version]
      @conn    = Faraday.new(endpoint, options[:conn_options]) do |faraday|
        faraday.request(:url_encoded)
        faraday.response(:logger)
        faraday.adapter(Faraday.default_adapter)
        faraday.params[:api_key] = api_key
      end
    end

    ENDPOINTS.each do |ep|
      method_name = ep.tr('-', '_')
      define_method(method_name) do |params = {}, &block|
        id = params.delete(:id).to_s
        conn.get([ep, id].join('/'), params, &block)
      end
    end
  end
end
