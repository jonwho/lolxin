module Lolxin
  class League < Api
    attr_accessor :endpoint

    def initialize(options = {})
      super
      @endpoint = "league/%{version}" % {version: @version}
    end

    %i(challenger master).each do |league|
      define_method("#{league}_by_queue".to_sym) do |queue|
        url = "#{endpoint}/#{league}leagues/by-queue/#{queue}"
        res = conn.get(url)
        return res if res.status != 200

        league_list = JSON.parse(res.body)
        LeagueListDto.new(league_list)
      end
    end

    def leagues(league_id)
      url = "#{endpoint}/leagues/#{league_id}"
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
