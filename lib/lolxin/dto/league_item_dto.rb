module Lolxin
  class LeagueItemDto
    attr_accessor *%i(
      rank
      hot_streak
      mini_series
      wins
      veteran
      losses
      player_or_team_name
      inactive
      fresh_blood
      league_points
    )

    def initialize(data)
      initialize_with(data)
    end

    private

    def initialize_with(data)
      @rank = data['rank']
      @hot_streak = data['hotStreak']
      @mini_series = MiniSeriesDto.new(data['miniSeries'])
      @wins = data['wins']
      @veteran = data['veteran']
      @losses = data['losses']
      @player_or_team_name = data['playerOrTeamName']
      @inactive = data['inactive']
      @fresh_blood = data['freshBlood']
      @league_points = data['leaguePoints']
    end
  end
end
