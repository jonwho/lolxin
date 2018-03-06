describe LolStaticData do
  let(:client)           { Client.new(ENV['API_KEY'], region: :br1) }
  let(:lol_static_data)  { client.lol_static_data }
  let(:doublelift)       { 20132258 }
  let(:champion_id)      { 39 }
  let(:item_id)          { 1001 }
  let(:mastery_id)       { 6111 }
  let(:rune_id)          { 5001 }
  let(:spell_id)         { 1 }
  let(:path_id)          { 8200 }
  let(:reforged_rune_id) { 8005 }

  describe '#champions' do
    it 'returns 200 status for all champions' do
      expect(lol_static_data.champions.status).to eq(200)
    end

    it 'returns 200 status for single champion_id' do
      expect(lol_static_data.champions(champion_id).status).to eq(200)
    end
  end

  describe '#items' do
    it 'returns 200 status for all items' do
      expect(lol_static_data.items.status).to eq(200)
    end

    it 'returns 200 status for single item_id' do
      expect(lol_static_data.items(item_id).status).to eq(200)
    end
  end

  describe '#masteries' do
    it 'returns 200 status for all masteries' do
      expect(lol_static_data.masteries.status).to eq(200)
    end

    it 'returns 200 status for single mastery_id' do
      expect(lol_static_data.masteries(mastery_id).status).to eq(200)
    end
  end

  describe '#runes' do
    it 'returns 200 status for all runes' do
      expect(lol_static_data.runes.status).to eq(200)
    end

    it 'returns 200 status for single rune_id' do
      expect(lol_static_data.runes(rune_id).status).to eq(200)
    end
  end

  describe '#summoner_spells' do
    it 'returns 200 status for all summoner_spells' do
      expect(lol_static_data.summoner_spells.status).to eq(200)
    end

    it 'returns 200 status for single spell_id' do
      expect(lol_static_data.summoner_spells(spell_id).status).to eq(200)
    end
  end

  describe '#reforged_rune_paths' do
    it 'returns 200 status for all reforged_rune_paths' do
      expect(lol_static_data.reforged_rune_paths.status).to eq(200)
    end

    it 'returns 200 status for single path_id' do
      expect(lol_static_data.reforged_rune_paths(path_id).status).to eq(200)
    end
  end

  describe '#reforged_runes' do
    it 'returns 200 status for all reforged_runes' do
      expect(lol_static_data.reforged_runes.status).to eq(200)
    end

    it 'returns 200 status for single reforged_rune_id' do
      expect(lol_static_data.reforged_runes(reforged_rune_id).status).to eq(200)
    end
  end

  %w[
    language_strings
    languages
    maps
    profile_icons
    realms
    versions
    tarball_links
  ].each do |method|
    describe "##{method}" do
      it 'returns 200 status' do
        expect(lol_static_data.send(method).status).to eq(200)
      end
    end
  end
end
