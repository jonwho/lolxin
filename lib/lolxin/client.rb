module Lolxin
  class ClientError < StandardError; end

  # Make a client that connects to the Riot API
  # Defaults to NA if given invalid region
  class Client
    attr_reader :region, :api_key

    def initialize(api_key, options = {})
      @api_key = api_key
      @region = options[:region] if Region.valid?(options[:region])
      raise ClientError, "Invalid region given" unless @region
    end

    def champion(options = {})
      options[:api_key] = api_key
      options[:region]  = region
      options[:version] = ApiVersion::CHAMPION
      Champion.new(options)
    end

    def lol_static_data(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      options[:version] ||= ApiVersion::LOL_STATIC_DATA
      LolStaticData.new(options)
    end

    def lol_status(options = {})
      LolStatus.new(options)
    end

    def current_game(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      CurrentGame.new(options)
    end

    def featured_games(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      FeaturedGames.new(options)
    end

    def game(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      options[:version] ||= ApiVersion::GAME
      Game.new(options)
    end

    def champion_mastery(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      ChampionMastery.new(options)
    end

    def league(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      options[:version] ||= ApiVersion::LEAGUE
      League.new(options)
    end
  end
end
