module Lolxin
  class LeagueListDto
    attr_accessor *%i(
      tier
      queue
      name
      entries
    )

    def initialize(data)
      initialize_with(data)
    end

    private

    def initialize_with(data)
      @tier = data['tier']
      @queue = data['queue']
      @name = data['name']
      @entries = data['entries'].map { |entry| LeagueItemDto.new(entry) }
    end
  end
end
