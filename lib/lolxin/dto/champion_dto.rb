module Lolxin
  class ChampionDto
    include Dto

    attr_accessor :ranked_play_enabled
    attr_accessor :bot_enabled
    attr_accessor :bot_mm_enabled
    attr_accessor :active
    attr_accessor :free_to_play
    attr_accessor :id

    def initialize(data)
      initialize_with(data)
    end

    private

    def initialize_with(data)
      @ranked_play_enabled = data['rankedPlayEnabled']
      @bot_enabled = data['botEnabled']
      @bot_mm_enabled = data['botMmEnabled']
      @active = data['active']
      @free_to_play = data['freeToPlay']
      @id = data['id']
    end
  end
end
