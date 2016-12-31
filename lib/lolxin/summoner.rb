module Lolxin
  class Summoner
    BASE_ENDPOINT = "https://%s.api.pvp.net/api/lol/%s/%s/summoner"

    attr_accessor :conn

    def initialize(options = {})
      region   = options[:region]
      api_key  = options[:api_key]
      version  = options[:version]
      endpoint = BASE_ENDPOINT % [region, region, version]
      @conn    = Faraday.new(endpoint, options[:conn_options]) do |faraday|
        faraday.request(:url_encoded)
        faraday.response(:logger)
        faraday.adapter(Faraday.default_adapter)
        faraday.params[:api_key] = api_key
      end
    end

    def by_name(params = {}, &block)
      summ_name = params.delete(:summonerNames)
      # Riot limits list to 40
      summ_name = summ_name[0...40].join(',') if summ_name.is_a? Array
      conn.get("by-name/#{summ_name}", params, &block)
    end

    def by_id(params = {}, &block)
      summ_id = params.delete(:summonerIds)
      # Riot limits list to 40
      summ_id = summ_id[0...40].join(',') if summ_id.is_a? Array
      conn.get("#{summ_id}", params, &block)
    end

    def masteries(params = {}, &block)
      summ_id = params.delete(:summonerIds)
      # Riot limits list to 40
      summ_id = summ_id[0...40].join(',') if summ_id.is_a? Array
      conn.get("#{summ_id}/masteries", params, &block)
    end

    def name(params = {}, &block)
      summ_id = params.delete(:summonerIds)
      # Riot limits list to 40
      summ_id = summ_id[0...40].join(',') if summ_id.is_a? Array
      conn.get("#{summ_id}/name", params, &block)
    end

    def runes(params = {}, &block)
      summ_id = params.delete(:summonerIds)
      # Riot limits list to 40
      summ_id = summ_id[0...40].join(',') if summ_id.is_a? Array
      conn.get("#{summ_id}/runes", params, &block)
    end
  end
end
