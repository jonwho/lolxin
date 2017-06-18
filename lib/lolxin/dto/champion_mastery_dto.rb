module Lolxin
  class ChampionMasteryDto
    attr_accessor :chest_granted
    attr_accessor :champion_level
    attr_accessor :champion_points
    attr_accessor :champion_id
    attr_accessor :player_id
    attr_accessor :champion_points_until_next_level
    attr_accessor :champion_points_since_last_level
    attr_accessor :last_play_time

    def initialize(data)
      initialize_with(data)
    end

    private

    def initialize_with(data)
      @chest_granted = data['chestGranted']
      @champion_level = data['championLevel']
      @champion_points = data['championPoints']
      @champion_id = data['championId']
      @player_id = data['playerId']
      @champion_points_until_next_level = data['championPointsUntilNextLevel']
      @champion_points_since_last_level = data['championPointsSinceLastLevel']
      @last_play_time = data['lastPlayTime']
    end
  end
end
