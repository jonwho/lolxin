describe ChampionMastery do
  let(:client)           { Client.new(ENV['API_KEY'], region: :na1) }
  let(:champion_mastery) { client.champion_mastery }
  let(:doublelift)       { 20132258 }
  let(:champion_id)      { 39 }

  describe '#by-summoner' do
    it 'retrieves a list of ChampionMasteryDto for a single summoner' do
      masteries = champion_mastery.by_summoner(doublelift)
      expect(masteries.length).to be >= 1
      masteries.each do |mastery|
        mastery.instance_variables.each do |iv|
          expect(mastery.instance_variable_get(iv)).not_to be nil
        end
      end
    end
  end

  describe '#by-champion' do
    it 'gets a ChampionMasteryDto for a single summoner on a champion' do
      mastery = champion_mastery.by_champion(doublelift, champion_id)
      mastery.instance_variables.each do |iv|
        expect(mastery.instance_variable_get(iv)).not_to be nil
      end
    end
  end

  describe '#scores' do
    it 'gets the total mastery score a summoner has for all champions' do
      expect(champion_mastery.scores(doublelift).to_i).to be > 0
    end
  end
end
