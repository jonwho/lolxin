require 'spec_helper'

describe Lolxin::Champions do
  let(:client) { client = Lolxin::Client.new ENV['API_KEY'] }
  let(:champions) { champions = client.champions }

  context '#initialize' do
    it 'should return instance of Lolxin::Champions' do
      expect(champions.class.name).to eq('Lolxin::Champions')
    end
  end

  context '#active' do
    it 'should return an array of champions that are active' do
      active = champions.active
      expect(active.empty?).to eq(false)
      active.each do |champ|
        expect(champ['active']).to eq(true)
      end
    end
  end

  context '#free_rotation' do
    it 'should return an array of champions in free rotation' do
      free_rotation = champions.free_rotation
      expect(free_rotation.empty?).to eq(false)
      free_rotation.each do |champ|
        expect(champ['freeToPlay']).to eq(true)
      end
    end
  end

  context '#rank_enabled' do
    it 'should return an array of champions that are rank enabled' do
      rank_enabled = champions.rank_enabled
      expect(rank_enabled.empty?).to eq(false)
      rank_enabled.each do |champ|
        expect(champ['rankedPlayEnabled']).to eq(true)
      end
    end
  end

  context '#rank_disabled' do
    it 'should return an array of champions that are rank disabled' do
      rank_disabled = champions.rank_disabled
      rank_disabled.each do |champ|
        expect(champ['rankedPlayEnabled']).to eq(false)
      end
    end
  end

  context '#bot_enabled' do
    it 'should return an array of champions that are bot enabled' do
      bot_enabled = champions.bot_enabled
      expect(bot_enabled.empty?).to eq(false)
      bot_enabled.each do |champ|
        expect(champ['botEnabled']).to eq(true)
      end
    end
  end

  context '#bot_disabled' do
    it 'should return an array of champions that are bot bot_disabled' do
      bot_disabled = champions.bot_disabled
      expect(bot_disabled.empty?).to eq(false)
      bot_disabled.each do |champ|
        expect(champ['botEnabled']).to eq(false)
      end
    end
  end

  context '#co_op_enabled' do
    it 'should return an array of champions that are co-op enabled' do
      co_op_enabled = champions.co_op_enabled
      expect(co_op_enabled.empty?).to eq(false)
      co_op_enabled.each do |champ|
        expect(champ['botMmEnabled']).to eq(true)
      end
    end
  end

  context '#co_op_disabled' do
    it 'should return an array of champions that are co-op disabled' do
      co_op_disabled = champions.co_op_disabled
      co_op_disabled.each do |champ|
        expect(champ['botMmEnabled']).to eq(false)
      end
    end
  end
end
