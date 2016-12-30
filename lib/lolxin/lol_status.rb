module Lolxin
  class LolStatus
    BASE_ENDPOINT = "http://status.leagueoflegends.com/shards"

    attr_accessor :conn
    attr_reader   :endpoint

    def initialize(_options = {})
      @endpoint = BASE_ENDPOINT
      @conn     = Faraday.new(url: @endpoint) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

    def shards(params = {})
      shard = params[:shard]
      ep = shard ? "#{endpoint}/#{shard}" : endpoint
      conn.get(ep, params)
    end
  end
end
