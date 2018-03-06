module Lolxin
  class ThirdPartyCode < Api
    attr_accessor :endpoint

    def initialize(options = {})
      super
      @endpoint = "platform/%{version}" % {version: @version}
    end

    def by_summoner(summoner_id)
      url = "#{endpoint}/by-summoner/#{summoner_id}"
      conn.get(url)
    end
  end
end
