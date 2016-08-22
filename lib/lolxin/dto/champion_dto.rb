module Lolxin
  class ChampionDtoError < Lolxin::DtoError
    def initialize(msg)
      super(msg)
    end
  end

  ATTRS = %w(id)
  BOOLS = %w(active bot_enabled bot_mm_enabled free_to_play ranked_play_enabled)

  class ChampionDto < Lolxin::Dto
    def initialize(json)
      super(json)
    end

    ATTRS.each do |attr|
      define_method attr do
        field = field_it attr
        raise ChampionDtoError.new "#{attr} not found" if data[field].nil?
        data[field]
      end
    end

    BOOLS.each do |bool|
      define_method "#{bool}?" do
        field = field_it bool
        raise ChampionDtoError.new "#{bool} not found" if data[field].nil?
        data[field]
      end
    end
  end
end
