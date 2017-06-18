module Lolxin
  class LolStatus < Api
    def shard_data
      conn.get("status/#{version}/shard-data")
    end
  end
end
