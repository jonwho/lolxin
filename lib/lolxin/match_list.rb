module Lolxin
  class MatchList
    BASE_ENDPOINT = "https://%s.api.pvp.net/api/lol/%s/%s/matchlist/by-summoner"
    #"/21421970"

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

    def by_summoner(params = {}, &block)
      summ_id = params.delete(:summonerId).to_s
      ranked_queues = params.delete(:rankedQueues)
      ranked_queues = ranked_queues.map(&:upcase).join(',') if ranked_queues.is_a? Array
      seasons = params.delete(:seasons)
      seasons = seasons.map(&:upcase).join(',') if seasons.is_a? Array
      params[:rankedQueues] = ranked_queues
      params[:seasons] = seasons
      conn.get(summ_id, params, &block)
    end
  end
end
