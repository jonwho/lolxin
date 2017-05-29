module Lolxin
  module Region
    REGIONS = {
      ru:   'ru',
      kr:   'kr',
      br1:  'br1',
      oc1:  'oc1',
      jp1:  'jp1',
      na1:  'na1',
      eun1: 'eun1',
      euw1: 'euw1',
      tr1:  'tr1',
      la1:  'la1',
      la2:  'la2'
    }

    def self.valid?(region)
      REGIONS[region] || REGIONS.values.find { |r| r == region }
    end
  end
end
