module Lolxin
  class Summoner < Api
    attr_accessor :endpoint

    def initialize(options = {})
      super
      @endpoint = "summoner/%{version}" % {version: @version}
    end

    def by_account(account_id)
      url = "#{endpoint}/summoners/by-account/#{account_id}"
      conn.get(url)
    end

    def by_name(summoner_name)
      url = "#{endpoint}/summoners/by-name/#{summoner_name}"
      conn.get(url)
    end

    def summoners(summoner_id)
      url = "#{endpoint}/summoners/#{summoner_id}"
      conn.get(url)
    end
  end
end
