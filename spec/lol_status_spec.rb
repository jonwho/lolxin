describe LolStatus do
  let(:client)     { Client.new(ENV['API_KEY'], region: :eun1) }
  let(:lol_status) { client.lol_status }

  describe '#shard_data' do
    it 'returns 200 status' do
      expect(lol_status.shard_data.status).to eq(200)
    end
  end
end
