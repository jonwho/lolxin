module Lolxin
  class GameInfoDto
    attr_accessor(*%i(
      game_id
      game_start_time
      platform_id
      game_mode
      map_id
      game_type
      banned_champions
      observers
      participants
      game_length
      game_queue_config_id
    ))

    def initialize(data)
      initialize_with(data)
    end

    private

    # TODO: finish this
    def initialize_with(data)
    end
  end

  CurrentGameInfoDto = FeaturedGameInfoDto = GameInfoDto
end
