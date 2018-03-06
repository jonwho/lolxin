module Lolxin
  class Spectator < Api
    CurrentGameInfo = FeaturedGameInfo = Struct.new(
      :game_id,
      :game_start_time,
      :platform_id,
      :game_mode,
      :map_id,
      :game_type,
      :banned_champions,
      :observers,
      :participants,
      :game_length,
      :game_queue_config_id
    )

    CurrentGameParticipant = Struct.new(
      :profile_icon_id,
      :champion_id,
      :summoner_name,
      :runes,
      :bot,
      :team_id,
      :spell2d,
      :masteries,
      :spell1d,
      :summoner_id
    )

    Rune = Struct.new(
      :count,
      :rune_id
    )

    Mastery = Struct.new(
      :mastery_id,
      :rank
    )

    FeaturedGames = Struct.new(
      :client_refresh_interval,
      :game_list
    )

    BannedChampion = Struct.new(
      :pick_turn,
      :champion_id,
      :team_id
    )

    Observer = Struct.new(
      :encryption_key
    )

    Participant = Struct.new(
      :profile_icon_id,
      :champion_id,
      :summoner_name,
      :bot,
      :spell2d,
      :team_id,
      :spell1id
    )

    attr_accessor :endpoint

    def initialize(options = {})
      super
      @endpoint = "spectator/%{version}" % {version: @version}
    end

    def by_summoner(summoner_id)
      url = "#{endpoint}/active-games/by-summoner/#{summoner_id}"
      res = conn.get(url)
      return res if res.status != 200

      current_game = JSON.parse(res.body)
      build_current_game_info(current_game)
    end

    def featured_games
      url = "#{endpoint}/featured-games"
      res = conn.get(url)
      return res if res.status != 200

      featured = JSON.parse(res.body)
      build_featured_games(featured)
    end

    private

    def build_current_game_info(current_game)
      CurrentGameInfo.new(
        current_game['gameId'],
        current_game['gameStartTime'],
        current_game['platformId'],
        current_game['gameMode'],
        current_game['mapId'],
        current_game['gameType'],
        build_banned_champions(current_game['bannedChampions']),
        build_observer(current_game['observers']),
        build_current_game_participants(current_game['participants']),
        current_game['gameLength'],
        current_game['gameQueueConfigId']
      )
    end

    def build_featured_games(featured_games)
      FeaturedGames.new(
        featured_games['clientRefreshInterval'],
        featured_games['gameList'].map { |f| build_featured_game_info(f) }
      )
    end

    def build_featured_game_info(feature)
      FeaturedGameInfo.new(
        feature['gameId'],
        feature['gameStartTime'],
        feature['platformId'],
        feature['gameMode'],
        feature['mapId'],
        feature['gameType'],
        build_banned_champions(feature['bannedChampions']),
        build_observer(feature['observer']),
        build_participants(feature['participants']),
        feature['gameLength'],
        feature['gameQueueConfigId']
      )
    end

    def build_banned_champions(banned_champions)
      return [] if banned_champions.nil? or banned_champions.empty?

      banned_champions.map do |banned_champion|
        BannedChampion.new(
          banned_champion['pickTurn'],
          banned_champion['championId'],
          banned_champion['teamId']
        )
      end
    end

    def build_observer(observer)
      return nil if observer.nil?

      Observer.new(observer['encryptionKey'])
    end

    def build_current_game_participants(participants)
      participants.map do |participant|
        CurrentGameParticipant.new(
          participant['profileIconId'],
          participant['championId'],
          participant['summonerName'],
          participant['runes'],
          participant['bot'],
          participant['teamId'],
          participant['spell2d'],
          participant['masteries'],
          participant['spell1id'],
          participant['summonerId']
        )
      end
    end

    def build_participants(participants)
      participants.map do |participant|
        Participant.new(
          participant['profileIconId'],
          participant['championId'],
          participant['summonerName'],
          participant['bot'],
          participant['spell2d'],
          participant['teamId'],
          participant['spell1id']
        )
      end
    end
  end
end
