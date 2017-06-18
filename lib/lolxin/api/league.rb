module Lolxin
  class League < Api
    BASE_ENDPOINT = "https://%{region}.api.riotgames.com/lol/league/%{version}"

    attr_accessor :endpoint

    def initialize(options = {})
      super
      @endpoint = "league/%{version}" % {version: @version}
    end

    def challenger_by_queue(queue)
      url = "#{endpoint}/challengerleagues/by-queue/#{queue}"
      res = conn.get(url)
      return res if res.status != 200

      league_list = JSON.parse(res.body)
      LeagueListDto.new(league_list)
    end

    def master_by_queue(queue)
      url = "#{endpoint}/masterleagues/by-queue/#{queue}"
      res = conn.get(url)
      return res if res.status != 200

      league_list = JSON.parse(res.body)
      LeagueListDto.new(league_list)
    end

    def league_by_summoner(summoner_id)
      url = "#{endpoint}/leagues/by-summoner/#{summoner_id}"
      res = conn.get(url)
      return res if res.status != 200

      league_lists = JSON.parse(res.body)
      league_lists.map { |league_list| LeagueListDto.new(league_list) }
    end

    def positions_by_summoner(summoner_id)
      url = "#{endpoint}/positions/by-summoner/#{summoner_id}"
      res = conn.get(url)
      return res if res.status != 200

      league_positions = JSON.parse(res.body)
      league_positions.map { |lp| LeaguePositionDto.new(lp) }
    end
  end
end
