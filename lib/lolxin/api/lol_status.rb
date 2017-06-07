module Lolxin
  class LolStatus
    BASE_ENDPOINT = "http://status.leagueoflegends.com/shards"

    attr_accessor :conn

    def initialize(options = {})
      endpoint = BASE_ENDPOINT
      @conn    = Faraday.new(endpoint, options[:conn_options]) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

    def shards(params = {})
      shard = params.delete(:shard).to_s
      conn.get(shard, params)
    end
  end
end
