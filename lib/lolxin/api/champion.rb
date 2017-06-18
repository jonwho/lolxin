module Lolxin
  class Champion < Api
    def initialize(options = {})
      super
    end

    def champions(id = nil)
      endpoint = "platform/%{version}/champions" % {version: version}

      res = if id.nil?
        conn.get(endpoint)
      else
        conn.get("#{endpoint}/#{id}")
      end

      return res if res.status != 200

      body = JSON.parse(res.body)

      if champs = body['champions']
        champs.map { |champ| ChampionDto.new(champ) }
      else
        champ = body
        ChampionDto.new(champ)
      end
    end
  end
end
