describe Champion do
  let(:champion) { Client.new(ENV['API_KEY'], region: :na1).champion }

  describe '#champions' do
    it 'retrieves a list of ChampionDto' do
      champs = champion.champions
      expect(champs.length).to be >= 1
      champs.each do |champ|
        champ.instance_variables.each do |iv|
          expect(champ.instance_variable_get(iv)).not_to be nil
        end
      end
    end

    it 'gets a champion by their numerical id' do
      champ = champion.champions(266)
      champ.instance_variables.each do |iv|
        expect(champ.instance_variable_get(iv)).not_to be nil
      end
    end
  end
end
