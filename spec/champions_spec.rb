describe Champions do
  let(:champions) { Client.new(ENV['API_KEY'], region: :na1).champions }

  describe '#all' do
    it 'retrieves a list of ChampionDTO' do
      champs = champions.all
      expect(champs.length).to be >= 1
      champs.each do |champ|
        expect(champ.values.any?(&:nil?)).to be(false)
      end
    end
  end

  describe '#find' do
    it 'gets a champion by their numerical id' do
      champ = champions.find(266)
      expect(champ.values.any?(&:nil?)).to be(false)
    end
  end
end
