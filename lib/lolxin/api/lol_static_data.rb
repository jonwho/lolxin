module Lolxin
  class LolStaticData < Api
    def initialize(options = {})
      super
      endpoint = "#{BASE_ENDPOINT}static-data/%{version}" % {region: @region, version: @version}
      @conn    = Faraday.new(endpoint, options[:conn_options]) do |faraday|
        faraday.request(:url_encoded)
        faraday.adapter(Faraday.default_adapter)
        faraday.params[:api_key] = api_key
      end
    end

    # TODO: get Faraday block to work with optional params
    def champions
      conn.get('champions')
    end

    def find_champion(champion_id)
      endpoint = "champions/#{champion_id}"
      conn.get(endpoint)
    end

    def items
      conn.get('items')
    end

    def find_item(item_id)
      endpoint = "items/#{item_id}"
      conn.get(endpoint)
    end

    def language_strings
      conn.get('language-strings')
    end

    def languages
      conn.get('languages')
    end

    def maps
      conn.get('maps')
    end

    def masteries
      conn.get('masteries')
    end

    def find_mastery(mastery_id)
      endpoint = "masteries/#{mastery_id}"
      conn.get(endpoint)
    end

    def profile_icons
      conn.get('profile-icons')
    end

    def realms
      conn.get('realms')
    end

    def runes
      conn.get('runes')
    end

    def find_rune(rune_id)
      endpoint = "runes/#{rune_id}"
      conn.get(endpoint)
    end

    def summoner_spells
      conn.get('summoner-spells')
    end

    def find_summoner_spell(spell_id)
      endpoint = "summoner_spells/#{spell_id}"
      conn.get(endpoint)
    end

    def versions
      conn.get('versions')
    end
  end
end
