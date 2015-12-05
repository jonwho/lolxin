module Lolxin
  # Idea is that an instance of champion will give you
  # getter methods to access champion data.
  # Maybe should make two classes
  # One to get a specific champion
  # Another one to get all champions
  # Champions.rb could be used to return stuff for
  # Champion.rb to use... think more laters
  class Champion

    def self.api_version
      'v1.2'
    end

    # Calling Champion.new(<champ_name>) gives you an instance
    # mapping to that champion.
    def initialize(api_key, champion)

    end

    private

    def get_champion_by_id( champion )

    end
  end
end
