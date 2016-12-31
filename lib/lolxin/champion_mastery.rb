module Lolxin
  class ChampionMasteryError < StandardError; end

  class ChampionMastery
    BASE_ENDPOINT = "https://%s.api.pvp.net/championmastery/location"

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

    def player_champion(params = {}, &block)
      player_id   = params.delete(:playerId)
      champion_id = params.delete(:championId)
      region      = params.delete(:region)
      raise(ChampionMasteryError, "Region given not in acceptable regions #{REGIONS}") unless REGIONS.include? region
      endpoint    = [region, 'player', player_id, 'champion', champion_id].join('/')
      conn.get(endpoint, params, &block)
    end

    def player_champions(params = {}, &block)
      player_id = params.delete(:playerId)
      region    = params.delete(:region)
      raise(ChampionMasteryError, "Region given not in acceptable regions #{REGIONS}") unless REGIONS.include? region
      endpoint  = [region, 'player', player_id, 'champions'].join('/')
      conn.get(endpoint, params, &block)
    end

    def player_score(params = {}, &block)
      player_id = params.delete(:playerId)
      region    = params.delete(:region)
      raise(ChampionMasteryError, "Region given not in acceptable regions #{REGIONS}") unless REGIONS.include? region
      endpoint  = [region, 'player', player_id, 'score'].join('/')
      conn.get(endpoint, params, &block)
    end

    def player_top_champions(params = {}, &block)
      player_id = params.delete(:playerId)
      region    = params.delete(:region)
      raise(ChampionMasteryError, "Region given not in acceptable regions #{REGIONS}") unless REGIONS.include? region
      endpoint  = [region, 'player', player_id, 'topchampions'].join('/')
      conn.get(endpoint, params, &block)
    end
  end
end
