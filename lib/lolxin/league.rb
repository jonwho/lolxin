module Lolxin
  class League
    BASE_ENDPOINT = "https://%{region}.api.riotgames.com/lol/league/%{version}"

    LeagueListDTO = Struct.new(
      :tier,
      :queue,
      :name,
      :entries
    )

    LeagueItemDTO = Struct.new(
      :rank,
      :hot_streak,
      :mini_series,
      :wins,
      :veteran,
      :losses,
      :player_or_team_name,
      :inactive,
      :fresh_blood,
      :league_points
    )

    MiniSeriesDTO = Struct.new(
      :wins,
      :losses,
      :target,
      :progress
    )

    LeaguePositionDTO = Struct.new(
      :rank,
      :queue_type,
      :hot_streak,
      :mini_series,
      :wins,
      :veteran,
      :losses,
      :player_or_team_id,
      :league_name,
      :player_or_team_name,
      :inactive,
      :fresh_blood,
      :tier,
      :league_points
    )

    attr_accessor :conn

    def initialize(options = {})
      region   = options[:region]
      version  = options[:version]
      api_key  = options[:api_key]
      endpoint = BASE_ENDPOINT % { region: region, version: version }
      @conn    = Faraday.new(endpoint, options[:conn_options]) do |faraday|
        faraday.request(:url_encoded)
        faraday.response(:logger)
        faraday.adapter(Faraday.default_adapter)
        faraday.params[:api_key] = api_key
      end
    end

    def challenger_by_queue(queue)
      endpoint = "challengerleagues/by-queue/#{queue}"
      res = conn.get(endpoint)
      return res if res.status != 200

      league_list = JSON.parse(res.body)
      build_league_list(league_list)
    end

    def league_by_summoner(summoner_id)
      endpoint = "leagues/by-summoner/#{summoner_id}"
      res = conn.get(endpoint)
      return res if res.status != 200

      league_lists = JSON.parse(res.body)
      league_lists.map { |league_list| build_league_list(league_list) }
    end

    def master_by_queue(queue)
      endpoint = "masterleagues/by-queue/#{queue}"
      res = conn.get(endpoint)
      return res if res.status != 200

      league_list = JSON.parse(res.body)
      build_league_list(league_list)
    end

    def positions_by_summoner(summoner_id)
      endpoint = "positions/by-summoner/#{summoner_id}"
      res = conn.get(endpoint)
      return res if res.status != 200

      league_positions = JSON.parse(res.body)
      league_positions.map { |lp| build_league_position(lp) }
    end

    private

    def build_league_list(league_list)
      LeagueListDTO.new(
        league_list['tier'],
        league_list['queue'],
        league_list['name'],
        league_list['entries'].map { |entry| build_league_item(entry) }
      )
    end

    def build_league_item(league_item)
      LeagueItemDTO.new(
        league_item['rank'],
        league_item['hotStreak'],
        build_mini_series(league_item['miniSeries']),
        league_item['wins'],
        league_item['veteran'],
        league_item['losses'],
        league_item['playerOrTeamName'],
        league_item['inactive'],
        league_item['freshBlood'],
        league_item['leaguePoints']
      )
    end

    def build_mini_series(mini_series)
      return nil if mini_series.nil?

      MiniSeriesDTO.new(
        mini_series['wins'],
        mini_series['losses'],
        mini_series['target'],
        mini_series['progress']
      )
    end

    def build_league_position(league_position)
      LeaguePositionDTO.new(
        league_position['rank'],
        league_position['queueType'],
        league_position['hotStreak'],
        build_mini_series(league_position['miniSeries']),
        league_position['wins'],
        league_position['veteran'],
        league_position['losses'],
        league_position['playerOrTeamId'],
        league_position['leagueName'],
        league_position['playerOrTeamName'],
        league_position['inactive'],
        league_position['freshBlood'],
        league_position['tier'],
        league_position['leaguePoints']
      )
    end
  end
end
