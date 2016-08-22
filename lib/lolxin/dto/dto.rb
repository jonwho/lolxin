# Data Transfer Object

module Lolxin
  class DtoError < StandardError
    def initialize(msg)
      super msg
    end
  end

  class Dto
    include Lolxin::JsonField
    attr_reader :data

    def initialize(json)
      @data = JSON.parse json
    end
  end
end
