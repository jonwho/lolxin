# NOTE: wouldn't bank on this always being right
# Doublelift may end up changing his name or transferring account
describe Summoner do
  let(:client)     { Client.new(ENV['API_KEY'], region: :na1) }
  let(:summoner)   { client.summoner }
  let(:doublelift) { 20132258 }
  let(:account_id) { 32971449 }
  let(:name)       { 'Doublelift' }

  describe '#by_account' do
    it 'returns 200 status' do
      expect(summoner.by_account(account_id).status).to eq(200)
    end
  end

  describe '#by_name' do
    it 'returns 200 status' do
      expect(summoner.by_name(name).status).to eq(200)
    end
  end

  describe '#summoners' do
    it 'returns 200 status' do
      expect(summoner.summoners(doublelift).status).to eq(200)
    end
  end
end
