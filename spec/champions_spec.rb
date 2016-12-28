describe Champions do
  let(:client)    { Client.new ENV['API_KEY'] }
  let(:champions) { client.champions }

  describe '#initialize' do
    it 'should return instance of Lolxin::Champions' do
      expect(champions.class.name).to eq('Lolxin::Champions')
    end
  end

  describe '#active' do
    it 'should return an array of champions that are active' do
      active = champions.active
      active.each do |champ|
        expect(champ[:active]).to eq(true)
      end
    end
  end

  describe '#free_rotation' do
    it 'should return an array of champions in free rotation' do
      free_rotation = champions.free_rotation
      free_rotation.each do |champ|
        expect(champ[:freeToPlay]).to eq(true)
      end
    end
  end

  describe '#rank_enabled' do
    it 'should return an array of champions that are rank enabled' do
      rank_enabled = champions.rank_enabled
      rank_enabled.each do |champ|
        expect(champ[:rankedPlayEnabled]).to eq(true)
      end
    end
  end

  describe '#rank_disabled' do
    it 'should return an array of champions that are rank disabled' do
      rank_disabled = champions.rank_disabled
      rank_disabled.each do |champ|
        expect(champ[:rankedPlayEnabled]).to eq(false)
      end
    end
  end

  describe '#bot_enabled' do
    it 'should return an array of champions that are bot enabled' do
      bot_enabled = champions.bot_enabled
      bot_enabled.each do |champ|
        expect(champ[:botEnabled]).to eq(true)
      end
    end
  end

  describe '#bot_disabled' do
    it 'should return an array of champions that are bot bot_disabled' do
      bot_disabled = champions.bot_disabled
      bot_disabled.each do |champ|
        expect(champ[:botEnabled]).to eq(false)
      end
    end
  end

  describe '#co_op_enabled' do
    it 'should return an array of champions that are co-op enabled' do
      co_op_enabled = champions.co_op_enabled
      co_op_enabled.each do |champ|
        expect(champ[:botMmEnabled]).to eq(true)
      end
    end
  end

  describe '#co_op_disabled' do
    it 'should return an array of champions that are co-op disabled' do
      co_op_disabled = champions.co_op_disabled
      co_op_disabled.each do |champ|
        expect(champ[:botMmEnabled]).to eq(false)
      end
    end
  end
end
