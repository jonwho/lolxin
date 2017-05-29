module Lolxin
  class ChampionMasteryError < StandardError; end

  class ChampionMastery
    BASE_ENDPOINT = "https://%{region}.api.riotgames.com/lol/champion-mastery/%{version}"

    ChampionMasteryDTO = Struct.new(
      :chest_granted,
      :champion_level,
      :champion_points,
      :champion_id,
      :player_id,
      :champion_points_until_next_level,
      :champion_points_since_last_level,
      :last_play_time
    )

    attr_accessor :conn

    def initialize(options = {})
      region   = options[:region]
      api_key  = options[:api_key]
      version  = options[:version]
      endpoint = BASE_ENDPOINT % { region: region, version: version }
      @conn    = Faraday.new(endpoint, options[:conn_options]) do |faraday|
        faraday.request(:url_encoded)
        faraday.response(:logger)
        faraday.adapter(Faraday.default_adapter)
        faraday.params[:api_key] = api_key
      end
    end

    def by_summoner(summoner_id)
      endpoint = "champion-masteries/by-summoner/#{summoner_id}"
      res = conn.get(endpoint)
      return res if res.status != 200

      champion_masteries = JSON.parse(res.body)
      champion_masteries.map do |champion_mastery|
        build_champion_mastery(champion_mastery)
      end
    end

    def by_champion(summoner_id, champion_id)
      endpoint = "champion-masteries/by-summoner/#{summoner_id}/by-champion/#{champion_id}"
      res = conn.get(endpoint)
      return res if res.status != 200

      champion_mastery = JSON.parse(res.body)
      build_champion_mastery(champion_mastery)
    end

    def total_score(summoner_id)
      res = conn.get("scores/by-summoner/#{summoner_id}")
      return res if res.status != 200

      res.body
    end

    private

    def build_champion_mastery(champion_mastery)
      ChampionMasteryDTO.new(
        champion_mastery['chestGranted'],
        champion_mastery['championLevel'],
        champion_mastery['championPoints'],
        champion_mastery['championId'],
        champion_mastery['playerId'],
        champion_mastery['championPointsUntilNextLevel'],
        champion_mastery['championPointsSinceLastLevel'],
        champion_mastery['lastPlayTime']
      )
    end
  end
end
