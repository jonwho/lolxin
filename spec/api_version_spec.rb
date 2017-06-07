describe ApiVersion do
  versions = {
    champions: 'v3',
    champion_mastery: 'v3',
    spectator: 'v3',
    league: 'v3',
    match: 'v3',
    static_data: 'v3',
    lol_status: 'v1.0',
    stats: 'v1.3',
    summoner: 'v1.4'
  }

  versions.each do |k, v|
    describe "::#{k.to_s.upcase}" do
      it 'returns most recent version' do
        expect(described_class.const_get(k.to_s.upcase)).to eq(v)
      end
    end
  end
end
