module Lolxin
  class LolStaticData < Api
    attr_accessor :endpoint

    def initialize(options = {})
      super
      @endpoint = "static-data/%{version}" % {version: @version}
    end

    # TODO: get Faraday block to work with optional params
    def champions(champion_id = nil)
      url = if champion_id
                   "#{endpoint}/champions/#{champion_id}"
                 else
                   "#{endpoint}/champions"
                 end

      conn.get(url)
    end

    def items(item_id = nil)
      url = if item_id
              "#{endpoint}/items/#{item_id}"
            else
              "#{endpoint}/items"
            end

      conn.get(url)
    end

    def language_strings
      url = "#{endpoint}/language-strings"
      conn.get(url)
    end

    def languages
      url = "#{endpoint}/languages"
      conn.get(url)
    end

    def maps
      url = "#{endpoint}/maps"
      conn.get(url)
    end

    def masteries(mastery_id = nil)
      url = if mastery_id
              "#{endpoint}/masteries/#{mastery_id}"
            else
              "#{endpoint}/masteries"
            end

      conn.get(url)
    end

    def profile_icons
      url = "#{endpoint}/profile-icons"
      conn.get(url)
    end

    def realms
      url = "#{endpoint}/realms"
      conn.get(url)
    end

    def reforged_rune_paths(path_id = nil)
      url = if path_id
              "#{endpoint}/reforged-rune-paths/#{path_id}"
            else
              "#{endpoint}/reforged-rune-paths"
            end

      conn.get(url)
    end

    def reforged_runes(reforged_rune_id = nil)
      url = if reforged_rune_id
              "#{endpoint}/reforged-runes/#{reforged_rune_id}"
            else
              "#{endpoint}/reforged-runes"
            end

      conn.get(url)
    end

    def runes(rune_id = nil)
      url = if rune_id
              "#{endpoint}/runes/#{rune_id}"
            else
              "#{endpoint}/runes"
            end

      conn.get(url)
    end

    def summoner_spells(spell_id = nil)
      url = if spell_id
              "#{endpoint}/summoner-spells/#{spell_id}"
            else
              "#{endpoint}/summoner-spells"
            end

      conn.get(url)
    end

    def tarball_links
      url = "#{endpoint}/tarball-links"
      conn.get(url)
    end

    def versions
      url = "#{endpoint}/versions"
      conn.get(url)
    end
  end
end
