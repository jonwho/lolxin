module Lolxin
  class GameInfoDto
    include Dto

    attr_accessor :game_id
    attr_accessor :game_start_time
    attr_accessor :platform_id
    attr_accessor :game_mode
    attr_accessor :map_id
    attr_accessor :game_type
    attr_accessor :banned_champions
    attr_accessor :observers
    attr_accessor :participants
    attr_accessor :game_length
    attr_accessor :game_queue_config_id

    def initialize(data)
      initialize_with(data)
    end
  end

  CurrentGameInfoDto = FeaturedGameInfoDto = GameInfoDto
end
