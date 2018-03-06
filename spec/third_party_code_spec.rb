describe ThirdPartyCode do
  let(:client)           { Client.new(ENV['API_KEY'], region: :na1) }
  let(:third_party_code) { client.third_party_code }
  let(:doublelift)       { 20132258 }

  # NOTE: verification system with the game client
  # doubtful to get code back unless i spin up the game again
  describe '#by_summoner' do
    xit 'returns 200 status' do
      # expect(third_party_code.by_summoner(doublelift).status).to eq(200)
    end
  end
end
