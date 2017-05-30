describe ChampionMastery do
  let(:client)           { Client.new(ENV['API_KEY'], region: :na1) }
  let(:champion_mastery) { client.champion_mastery }
  let(:summoner_id)      { 20143034 }
  let(:champion_id)      { 39 }

  describe '#by-summoner' do
    it 'retrieves a list of ChampionMasterDTO for a single summoner' do
      masteries = champion_mastery.by_summoner(summoner_id)
      expect(masteries.length).to be >= 1
      masteries.each do |mastery|
        expect(mastery.values.any?(&:nil?)).to be(false)
      end
    end
  end

  describe '#by-champion' do
    it 'gets a ChampionMasterDTO for a single summoner on a champion' do
      mastery = champion_mastery.by_champion(summoner_id, champion_id)
      expect(mastery.values.any?(&:nil?)).to be(false)
    end
  end

  describe '#total_score' do
    it 'gets the total mastery score a summoner has for all champions' do
      expect(champion_mastery.total_score(summoner_id).to_i).to be > 0
    end
  end
end
