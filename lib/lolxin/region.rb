module Lolxin
  module Region
    REGIONS = {
      br:   'br',
      eune: 'eune',
      euw:  'euw',
      jp:   'jp',
      kr:   'kr',
      lan:  'lan',
      las:  'las',
      na:   'na',
      oce:  'oce',
      pbe:  'pbe',
      ru:   'ru',
      tr:   'tr'
    }

    def self.valid?(region)
      REGIONS[region] || REGIONS.values.find { |r| r == region }
    end
  end
end
