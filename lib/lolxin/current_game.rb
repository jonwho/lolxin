module Lolxin
  class CurrentGameError < StandardError; end

  class CurrentGame
    BASE_ENDPOINT = "https://%s.api.pvp.net/observer-mode/rest/consumer/getSpectatorGameInfo"

    REGIONS = %w[
      BR1
      EUN1
      EUW1
      JP1
      KR
      LA1
      LA2
      NA1
      OC1
      PBE1
      RU
      TR1
    ]

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
      region   = params.delete(:region).to_s
      raise(CurrentGameError, "Region given not in acceptable regions #{REGIONS}") unless REGIONS.include? region
      summ_id  = params.delete(:summonerId).to_s
      endpoint = [region, summ_id].join('/')
      conn.get(endpoint, params, &block)
    end
  end
end
