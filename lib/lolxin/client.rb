module Lolxin
  class ClientError < StandardError; end

  # Client create connection clients for specific endpoints
  class Client
    ENDPOINTS = [
      :champion_mastery,
      :champion,
      :league,
      :lol_static_data,
      :lol_status,
      :match,
      :spectator,
      :summoner
      #tournament_stub
      #tournament
    ]

    attr_reader :region, :api_key, :options

    def initialize(api_key, options = {})
      @api_key = api_key
      @region  = options[:region] if Region.valid?(options[:region])
      @options = { api_key: @api_key, region: @region }
      raise ClientError, "Invalid API key" if @api_key.nil? || @api_key.empty?
      raise ClientError, "Invalid region" unless @region
    end

    ENDPOINTS.each do |ep|
      define_method(ep) do |options = @options|
        options[:version] = ApiVersion.const_get(ep.to_s.upcase)

        name  = ep.to_s.split('_').map(&:capitalize).join
        klass = Object.const_get(name)
        klass.new(options)
      end
    end
  end
end
