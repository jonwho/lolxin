module Lolxin
  class Champions
    BASE_ENDPOINT = "https://%{region}.api.riotgames.com/lol/platform/%{version}/champions"

    attr_accessor :conn

    def initialize(options = {})
      region   = options[:region]
      api_key  = options[:api_key]
      version  = options[:version] || ApiVersion::CHAMPIONS
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
      champs.map { |champ| ChampionDto.new(champ) }
    end

    def find(id)
      res = conn.get(id.to_s)
      return res if res.status != 200

      body = JSON.parse(res.body)
      ChampionDto.new(body)
    end
  end
end
