module Lolxin
  class LolStatic
    STATIC_ENDPOINT = "https://global.api.pvp.net/api/lol/static-data"

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
    attr_reader   :endpoint, :api_key

    def initialize(options = {})
      region    = options[:region]
      version   = options[:version]
      @api_key  = options[:api_key]
      @endpoint = [STATIC_ENDPOINT, region, version].join('/')
      @conn     = Faraday.new(url: @endpoint) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

    ENDPOINTS.each do |ep|
      method_name = ep.tr('-', '_')
      define_method(method_name) do |params = {}, &block|
        id = params.delete(:id)
        params[:api_key] = api_key
        conn.get([ep, id].join('/'), params, &block)
      end
    end
  end
end
