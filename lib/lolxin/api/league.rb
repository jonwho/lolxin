module Lolxin
  class League < Api
    BASE_ENDPOINT = "https://%{region}.api.riotgames.com/lol/league/%{version}"

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

    %i(leagues positions).each do |method|
      define_method("#{method}_by_summoner".to_sym) do |summoner_id|
        url = "#{endpoint}/#{method}/by-summoner/#{summoner_id}"
        res = conn.get(url)
        return res if res.status != 200

        case method
        when :leagues
          league_lists = JSON.parse(res.body)
          league_lists.map { |league_list| LeagueListDto.new(league_list) }
        when :positions
          league_positions = JSON.parse(res.body)
          league_positions.map { |lp| LeaguePositionDto.new(lp) }
        end
      end
    end
  end
end
