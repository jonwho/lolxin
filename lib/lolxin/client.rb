# General idea right now is that client makes top level calls
# which return instances that relate to that call.
# Wrapped in each instance then will be calls to get even
# further specific data about that instance.
# Example is grabbing specific champion. Getting a champion
# will return its object. In Champion class make methods to
# grab more data off the returned DTO or further API calls
# to retrieve more goodies.
module Lolxin
  # Make a client that connects to the Riot API.
  # Specify your region here or it defaults to NA.
  class Client
    attr_reader :region

    # api_key parameter necessary to make api calls
    # options not provided means will set to defaults
    def initialize(api_key, options = {})
      @api_key = api_key
      region = validate_region(options[:region])
      @region = region || Region::REGIONS[:NA]
    end

    # Returns a new Champion instance.
    def champion( champion_name = nil )
      Champion.new @api_key, champion_name
    end

    # Returns a new Champions instance.
    def champions
      Champions.new @api_key, @region
    end

    private

    # Returns country code if supported by Riot API else return false.
    def validate_region(region)
      return false if region.nil?
      Region::REGIONS[region.upcase.to_sym] rescue "Expected String type but got #{region.class.name} instead."
    end

  end # Client
end # Lolxin
