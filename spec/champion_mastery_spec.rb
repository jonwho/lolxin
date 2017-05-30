describe ChampionMastery do
  let(:client)           { Client.new(ENV['API_KEY'], region: :na1) }
  let(:champion_mastery) { client.champion_mastery }
  let(:doublelift)       { 20132258 }
  let(:champion_id)      { 39 }

  describe '#by-summoner' do
    it 'retrieves a list of ChampionMasterDTO for a single summoner' do
      masteries = champion_mastery.by_summoner(doublelift)
      expect(masteries.length).to be >= 1
      masteries.each do |mastery|
        expect(mastery.values.any?(&:nil?)).to be(false)
      end
    end
  end

  describe '#by-champion' do
    it 'gets a ChampionMasterDTO for a single summoner on a champion' do
      mastery = champion_mastery.by_champion(doublelift, champion_id)
      expect(mastery.values.any?(&:nil?)).to be(false)
    end
  end

  describe '#total_score' do
    it 'gets the total mastery score a summoner has for all champions' do
      expect(champion_mastery.total_score(doublelift).to_i).to be > 0
    end
  end
end
