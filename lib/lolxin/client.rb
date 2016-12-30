module Lolxin
  # Make a client that connects to the Riot API.
  # Specify your region here or it defaults to NA.
  class Client
    attr_reader :region, :api_key

    # api_key parameter necessary to make api calls
    # options not provided means will set to defaults
    def initialize(api_key, options = {})
      @api_key = api_key
      region = validate_region(options[:region])
      @region = region || Region::REGIONS[:NA]
    end

    # Returns a new Champion instance.
    def champion(champion_name = nil, options = {})
      Champion.new(api_key, champion_name, options)
    end

    # Returns a new Champions instance.
    def champions(options = {})
      options[:region] ||= region
      Champions.new(api_key, options)
    end

    def lol_static(options = {})
      options[:region] ||= region
      LolStatic.new(api_key, options)
    end

    private

    # Returns country code if supported by Riot API else return false.
    def validate_region(region)
      return false if region.nil?
      Region::REGIONS[region.upcase.to_sym] rescue "Expected String type but got #{region.class.name} instead."
    end
  end # Client
end # Lolxin
