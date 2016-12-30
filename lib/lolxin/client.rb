module Lolxin
  # Make a client that connects to the Riot API
  # Defaults to NA if given invalid region
  class Client
    attr_reader :region, :api_key

    def initialize(api_key, options = {})
      @api_key = api_key
      region = validate_region(options[:region])
      @region = region || Region::REGIONS[:NA]
    end

    def champion(champion_name = nil, options = {})
      Champion.new(api_key, champion_name, options)
    end

    def champions(options = {})
      options[:region] ||= region
      Champions.new(api_key, options)
    end

    def lol_static(options = {})
      options[:api_key] ||= api_key
      options[:region]  ||= region
      options[:version] ||= ApiVersion::LOL_STATIC_DATA
      LolStatic.new(options)
    end

    private

    # Returns country code if supported by Riot API else return false.
    def validate_region(region)
      return false if region.nil?
      Region::REGIONS[region.upcase.to_sym] rescue "Expected String type but got #{region.class.name} instead."
    end
  end
end
