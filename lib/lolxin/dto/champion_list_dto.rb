module Lolxin
  class ChampionListDtoError < Lolxin::DtoError
    def initialize(msg)
      super(msg)
    end
  end

  class ChampionListDto < Lolxin::Dto
    attr_reader :champions

    def initialize(json)
      super(json)

      @champions = data['champions']
      unless @champions.nil?
        @champions = @champions.map do |c|
          Lolxin::ChampionDto.new c
        end
      end
    end
  end
end
