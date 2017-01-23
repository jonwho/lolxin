describe Lolxin::ChampionMastery do
  let(:client)           { Lolxin::Client.new(ENV['API_KEY'], region: :na) }
  let(:champion_mastery) { client.champion_mastery }

  describe '#player_champion' do
    it 'returns 200 response' do
    end
  end
end
