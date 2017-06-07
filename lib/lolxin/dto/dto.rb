module Lolxin
  class Dto
    def initialize
      yield self if block_given?
    end
  end
end
