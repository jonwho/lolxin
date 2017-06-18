module Lolxin
  class ChampionMastery < Api
    attr_reader :endpoint

    def initialize(options = {})
      super
      @endpoint = "champion-mastery/%{version}" % {version: @version}
    end

    def by_summoner(summoner_id)
      url = "#{endpoint}/champion-masteries/by-summoner/#{summoner_id}"
      res = conn.get(url)
      return res if res.status != 200

      champion_masteries = JSON.parse(res.body)
      champion_masteries.map do |champion_mastery|
        ChampionMasteryDto.new(champion_mastery)
      end
    end

    def by_summoner_by_champion(summoner_id, champion_id)
      url = "#{endpoint}/champion-masteries/by-summoner/#{summoner_id}/by-champion/#{champion_id}"
      res = conn.get(url)
      return res if res.status != 200

      champion_mastery = JSON.parse(res.body)
      ChampionMasteryDto.new(champion_mastery)
    end
    alias_method :by_champion, :by_summoner_by_champion

    def scores(summoner_id)
      res = conn.get("#{endpoint}/scores/by-summoner/#{summoner_id}")
      return res if res.status != 200

      res.body
    end
  end
end
