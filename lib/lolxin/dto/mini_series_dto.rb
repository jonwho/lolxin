module Lolxin
  class MiniSeriesDto
    attr_accessor(*%i(
      wins
      losses
      target
      progress
    ))

    def initialize(data)
      return nil if data.nil?

      initialize_with(data)
    end

    private

    def initialize_with(data)
      @wins     = data['wins']
      @losses   = data['losses']
      @target   = data['target']
      @progress = data['progress']
    end
  end
end
