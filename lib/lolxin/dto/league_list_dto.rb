module Lolxin
  class LeagueListDto
    attr_accessor(*%i(
      tier
      queue
      name
      entries
      data
      league_id
    ))

    def initialize(data)
      @data = data
      initialize_with(data)
    end

    private

    def initialize_with(data)
      @league_id = data['leagueId']
      @tier      = data['tier']
      @queue     = data['queue']
      @name      = data['name']
      @entries   = data['entries'].map { |entry| LeagueItemDto.new(entry) }
    end
  end
end
