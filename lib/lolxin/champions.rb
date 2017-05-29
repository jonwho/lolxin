module Lolxin
  class Champions
    BASE_ENDPOINT = "https://%{region}.api.riotgames.com/lol/platform/%{version}/champions"

    Champion = Struct.new(
      :ranked_play_enabled,
      :bot_enabled,
      :bot_mm_enabled,
      :active,
      :free_to_play,
      :id
    )

    attr_accessor :conn

    def initialize(options = {})
      region   = options[:region]
      version  = options[:version]
      api_key  = options[:api_key]
      endpoint = BASE_ENDPOINT % {region: region, version: version}
      @conn    = Faraday.new(endpoint, options[:conn_options]) do |faraday|
        faraday.request(:url_encoded)
        faraday.response(:logger)
        faraday.adapter(Faraday.default_adapter)
        faraday.params[:api_key] = api_key
      end
    end

    def all
      res = conn.get
      return res if res.status != 200

      body = JSON.parse(res.body)
      champs = body['champions']
      champs.map do |champ|
        build_champion(champ)
      end
    end

    def find(id)
      res = conn.get(id.to_s)
      return res if res.status != 200

      body = JSON.parse(res.body)
      build_champion(body)
    end

    private

    def build_champion(champ)
      Champion.new(
        champ['rankedPlayEnabled'],
        champ['botEnabled'],
        champ['botMmEnabled'],
        champ['active'],
        champ['freeToPlay'],
        champ['id']
      )
    end
  end
end
