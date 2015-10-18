require_relative 'api_version'

module Lolxin
  # This returns the Champions object which contains data
  # about all the current champions from either static
  # or region specific APIs.
  # Idea is that each new Champions instance will make a call
  # to the endpoints returning a new list. Older instances
  # will hold data that might become stale in the future
  # so must be careful when caching these instances.
  class Champions
    attr_reader :region_champions, :static_champions 

    def self.api_version
      'v1.2'
    end

    # the json keys are strings because that's how the data gets moved back and forth
    # cannot access with ruby symbols
    # also spelling matters when accessing the data so 'thresh' has to be 'Thresh' in
    # order to access data properly! either find a ruby gem that does english stuffs
    # or make constants or some other method to make champion access easier
    # which might be a reoccurring problem with item names as well
    def initialize( api_key, region )
      @region_api = "https://#{region}.api.pvp.net/api/lol/#{region}/" + api_version + "/champion"
      @static_api = "https://global.api.pvp.net/api/lol/static-data/#{region}/" + api_version + "/champion"

      @region_champions_conn = Faraday.new(:url => "#{@region_api}",
                                           :params => { :api_key => "#{api_key}"}) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
      @static_champions_conn = Faraday.new(:url => "#{@static_api}",
                                           :params => { :api_key => "#{api_key}"}) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end

      @region_champions = JSON.parse @region_champions_conn.get.body
      @static_champions = JSON.parse @static_champions_conn.get.body
    end

    # Return champions that are in free rotation.
    def free_rotation
      # in the future should add new Champion objects
      # to the array instead of the id so that user
      # can make further calls on the Champion class
      # to get more info
      @region_champions['champions'].inject([]) do |memo, champ|
        memo << champ['id'] if champ['freeToPlay']
      end
    end

    # Return champions that are rank enabled.
    def rank_enabled

    end

    # Return champions that are rank disabled.
    def rank_disabled

    end

    # Return champions that are bot enabled.
    def bot_enabled

    end

    # Returns champions that are bot disabled.
    def bot_disabled

    end

    # Returns champions that are co-op bots enabled.
    def co_op_enabled

    end

    # Returns champions that are co-op bots disabled.
    def co_op_disabled

    end

    # Returns champions that are ...
    def self.something
      'something'


    end
  end
end
