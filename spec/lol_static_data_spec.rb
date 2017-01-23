describe Lolxin::LolStaticData do
  let(:client) { Lolxin::Client.new(ENV['API_KEY'], region: :na) }
  let(:lsd)    { client.lol_static_data }

  describe '#champion' do
    it 'returns champion data by id' do
      resp = lsd.champion(id: 101)
      expect(resp.status).to eq(200)
    end
  end

  describe '#item' do
    it 'returns item data by id' do
      resp = lsd.item(id: 1419)
      expect(resp.status).to eq(200)
    end
  end
end
