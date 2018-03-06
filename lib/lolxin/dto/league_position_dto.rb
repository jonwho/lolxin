module Lolxin
  class LeaguePositionDto
    attr_accessor(*%i(
      rank
      queue_type
      hot_streak
      mini_series
      wins
      veteran
      losses
      player_or_team_id
      league_name
      player_or_team_name
      inactive
      fresh_blood
      tier
      league_points
    ))

    def initialize(data)
      initialize_with(data)
    end

    private

    def initialize_with(data)
      @rank                = data['rank']
      @queue_type          = data['queueType']
      @hot_streak          = data['hotStreak']
      @mini_series         = MiniSeriesDto.new(data['miniSeries'])
      @wins                = data['wins']
      @veteran             = data['veteran']
      @losses              = data['losses']
      @player_or_team_id   = data['playerOrTeamId']
      @league_name         = data['leagueName']
      @player_or_team_name = data['playerOrTeamName']
      @inactive            = data['inactive']
      @fresh_blood         = data['freshBlood']
      @tier                = data['tier']
      @league_points       = data['leaguePoints']
    end
  end
end
