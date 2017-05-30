module Lolxin
  class ClientError < StandardError; end

  # Client create connection clients for specific endpoints
  class Client
    attr_reader :region, :api_key

    def initialize(api_key, options = {})
      @api_key = api_key
      @region = options[:region] if Region.valid?(options[:region])
      raise ClientError, "Invalid region given" unless @region
    end

    def champions(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      options[:version] ||= ApiVersion::CHAMPIONS
      Champions.new(options)
    end

    def champion_mastery(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      options[:version] ||= ApiVersion::CHAMPION_MASTERY
      ChampionMastery.new(options)
    end

    def spectator(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      options[:version] ||= ApiVersion::SPECTATOR
      Spectator.new(options)
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

    def league(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      options[:version] ||= ApiVersion::LEAGUE
      League.new(options)
    end

    def match(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      options[:version] ||= ApiVersion::MATCH
      Match.new(options)
    end

    def match_list(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      options[:version] ||= ApiVersion::MATCH_LIST
      MatchList.new(options)
    end

    def stats(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      options[:version] ||= ApiVersion::STATS
      Stats.new(options)
    end

    def summoner(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      options[:version] ||= ApiVersion::SUMMONER
      Summoner.new(options)
    end
  end
end
