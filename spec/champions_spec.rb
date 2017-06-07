describe Champions do
  let(:champions) { Client.new(ENV['API_KEY'], region: :na1).champions }

  describe '#all' do
    it 'retrieves a list of ChampionDto' do
      champs = champions.all
      expect(champs.length).to be >= 1
      champs.each do |champ|
        champ.instance_variables.each do |iv|
          expect(champ.instance_variable_get(iv)).not_to be nil
        end
      end
    end
  end

  describe '#find' do
    it 'gets a champion by their numerical id' do
      champ = champions.find(266)
      champ.instance_variables.each do |iv|
        expect(champ.instance_variable_get(iv)).not_to be nil
      end
    end
  end
end
