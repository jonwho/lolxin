# Data Transfer Object

module Lolxin
  class Dto
    attr_accessor :data
    def initialize(json)
      @data = json
    end
  end
end
