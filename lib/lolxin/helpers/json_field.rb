module Lolxin
  module JsonField
    extend self

    def field_it(string)
      string.split('_').each_with_index.map do |value, index|
        if index == 0
          value.downcase
        else
          value.capitalize
        end
      end
      .join
    end
  end
end
