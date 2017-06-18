module Lolxin
  class Dto
    def initialize(data)
    end

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
