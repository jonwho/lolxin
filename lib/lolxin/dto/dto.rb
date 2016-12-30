# Data Transfer Object

module Lolxin
  class DtoError < StandardError
    def initialize(msg)
      super(msg)
    end
  end

  class Dto
    include Lolxin::JsonField
    attr_reader :data

    def initialize(json)
      if json.is_a? String
        @data = JSON.parse(json)
      else
        @data = json
      end
    end
  end
end
