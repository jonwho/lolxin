module Lolxin
  class Champion
    attr_reader :id,
                :active,
                :botEnabled,
                :freeToPlay,
                :botMmEnabled,
                :rankedPlayEnabled

    # Idea now is to build a Champion with as much data as possible.
    def initialize(options = {})
      @id = options[:id]
      @active = options[:active]
      @botEnabled = options[:botEnabled]
      @freeToPlay = options[:freeToPlay]
      @botMmEnabled = options[:botMmEnabled]
      @rankedPlayEnabled = options[:rankedPlayEnabled]
    end

  end
end
