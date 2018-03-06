module Lolxin
  class Match
    attr_accessor :endpoint

    # TODO: many endpoints to change and many DTOs to add
    def initialize(options = {})
      super
      @endpoint = "match/%{version}" % {version: @version}
    end

    def matches(match_id)
      url = "#{endpoint}/matches/#{match_id}"
      conn.get(url)
    end

    def by_account(account_id, recent = false)
      url = if recent
              "#{endpoint}/matchlists/by-account/#{account_id}/recent"
            else
              "#{endpoint}/matchlists/by-account/#{account_id}"
            end

      conn.get(url)
    end

    def by_match(match_id)
      url = "#{endpoint}/timelines/by-match/#{match_id}"
      conn.get(url)
    end

    def tournament_code(tournament_code, match_id)
      url = if tournament_code && match_id
              "matches/by-tournament-code/#{tournament_code}/ids"
            else
              "matches/#{match_id}/by-tournament-code/#{tournament_code}"
            end

      conn.get(url)
    end
  end
end
