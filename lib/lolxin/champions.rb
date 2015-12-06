module Lolxin
  # This returns the Champions object which contains data
  # about all the current champions from either static
  # or region specific APIs.
  # Idea is that each new Champions instance will make a call
  # to the endpoints returning a new list. Older instances
  # will hold data that might become stale in the future
  # so must be careful when caching these instances.
  class Champions
    attr_reader :champion_api_response, :lol_static_data_response

    # the json keys are strings because that's how the data gets moved back and forth
    # cannot access with ruby symbols
    # also spelling matters when accessing the data so 'thresh' has to be 'Thresh' in
    # order to access data properly! either find a ruby gem that does english stuffs
    # or make constants or some other method to make champion access easier
    # which might be a reoccurring problem with item names as well
    def initialize(api_key, region)
      @champion_api =  "https://#{region}.api.pvp.net/api/lol/#{region}/#{ApiVersion::CHAMPION}/champion?api_key=#{api_key}"
      @lol_static_data_api =  "https://global.api.pvp.net/api/lol/static-data/#{region}/#{ApiVersion::LOL_STATIC_DATA}/champion?champData=all&api_key=#{api_key}"
      @champion_api_response = JSON.parse HTTParty.get(@champion_api).body, :symbolize_names => true
      @lol_static_data_response = JSON.parse HTTParty.get(@lol_static_data_api).body, :symbolize_names => true
      @champion_api_response = @champion_api_response[:champions]
      @lol_static_data_response = @lol_static_data_response[:data]

      @champions = []
      @active_champs = []
      @free_rotation_champs = []
      @rank_enabled_champs = []
      @rank_disabled_champs = []
      @bot_enabled_champs = []
      @bot_disabled_champs = []
      @co_op_enabled_champs = []
      @co_op_disabled_champs = []
      construct_champions
    end

    def construct_champions

    end

    def all
      @champions
    end
    # Return champions that are active.
    def active
      if @active_champs.empty?
        @champion_api_response.inject(@active_champs) do |memo, champ|
          memo << champ if champ[:active]
          memo
        end
      end
      @active_champs
    end

    # Return champions that are in free rotation.
    def free_rotation
      # in the future should add new Champion objects
      # to the array instead of the id so that user
      # can make further calls on the Champion class
      # to get more info

      if @free_rotation_champs.empty?
        @champion_api_response.inject(@free_rotation_champs) do |memo, champ|
          memo << champ if champ[:freeToPlay]
          memo
        end
      end
      @free_rotation_champs
    end

    # Return champions that are rank enabled.
    def rank_enabled
      if @rank_enabled_champs.empty?
        @champion_api_response.each do |champ|
          if champ[:rankedPlayEnabled]
            @rank_enabled_champs << champ
          else
            @rank_disabled_champs << champ
          end
        end
      end
      @rank_enabled_champs
    end

    # Return champions that are rank disabled.
    def rank_disabled
      rank_enabled
      @rank_disabled_champs
    end

    # Return champions that are bot enabled.
    def bot_enabled
      if @bot_enabled_champs.empty?
        @champion_api_response.each do |champ|
          if champ[:botEnabled]
            @bot_enabled_champs << champ
          else
            @bot_disabled_champs << champ
          end
        end
      end
      @bot_enabled_champs
    end

    # Returns champions that are bot disabled.
    def bot_disabled
      bot_enabled
      @bot_disabled_champs
    end

    # Returns champions that are co-op bots enabled.
    def co_op_enabled
      if @co_op_enabled_champs.empty?
        @champion_api_response.each do |champ|
          if champ[:botMmEnabled]
            @bot_enabled_champs << champ
          else
            @bot_disabled_champs << champ
          end
        end
      end
      @bot_enabled_champs
    end

    # Returns champions that are co-op bots disabled.
    def co_op_disabled
      co_op_enabled
      @co_op_disabled_champs
    end
  end
end
