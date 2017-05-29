describe Champions do
  let(:champions) { Client.new(ENV['API_KEY'], region: :na1).champions }

  describe '#all' do
    it 'retrieves a list of ChampionDTO' do
      champs = champions.all
      expect(champs.length).to be >= 1
      champs.each do |champ|
        expect(champ.ranked_play_enabled).not_to be(nil)
        expect(champ.bot_enabled).not_to be(nil)
        expect(champ.bot_mm_enabled).not_to be(nil)
        expect(champ.active).not_to be(nil)
        expect(champ.free_to_play).not_to be(nil)
        expect(champ.id).not_to be(nil)
      end
    end
  end

  describe '#find' do
    it 'gets a champion by their numerical id' do
      champ = champions.find(266)
      expect(champ.ranked_play_enabled).not_to be(nil)
      expect(champ.bot_enabled).not_to be(nil)
      expect(champ.bot_mm_enabled).not_to be(nil)
      expect(champ.active).not_to be(nil)
      expect(champ.free_to_play).not_to be(nil)
      expect(champ.id).not_to be(nil)
    end
  end
end
