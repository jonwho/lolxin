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

    def lol_status(options = {})
      LolStatus.new(options)
    end
  end
end
