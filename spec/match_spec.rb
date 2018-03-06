# TODO: need to find test values
describe Match do
  let(:client) { Client.new(ENV['API_KEY'], region: :euw1) }
  let(:match)  { client.match }

  describe '#matches' do
    xit 'returns 200 status' do
    end
  end

  describe '#by_account' do
    xit 'returns 200 status' do
    end

    xit 'returns 200 status for recent' do
    end
  end

  describe '#by_match' do
    xit 'returns 200 status' do
    end
  end

  describe '#tournament_code' do
    xit 'returns 200 status' do
    end
  end
end
