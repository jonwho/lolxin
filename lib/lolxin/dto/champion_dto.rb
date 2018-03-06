module Lolxin
  class ChampionDto
    attr_accessor(*%i(
      ranked_play_enabled
      bot_enabled
      bot_mm_enabled
      active
      free_to_play
      id
    ))

    def initialize(data)
      initialize_with(data)
    end

    private

    def initialize_with(data)
      @ranked_play_enabled = data['rankedPlayEnabled']
      @bot_enabled         = data['botEnabled']
      @bot_mm_enabled      = data['botMmEnabled']
      @active              = data['active']
      @free_to_play        = data['freeToPlay']
      @id                  = data['id']
    end
  end
end
