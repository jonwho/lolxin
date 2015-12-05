require 'spec_helper'

describe Lolxin::Champions do
  let(:client) { client = Lolxin::Client.new ENV['API_KEY'] }
  let(:champions) { champions = client.champions}

  context '#new' do
    it 'should return instance of Lolxin::Champions' do
      expect(champions.class.name).to eq('Lolxin::Champions')
    end
  end

  context '#free_rotation' do
    it 'should return an array of champions in free rotation' do
      free_rotation = champions.free_rotation
      expect(free_rotation.instance_of? Array).to eq(true)
      #free_rotation.each do |c|
        #expect c.
      #end
    end
  end

  context '#rank_enabled' do
    it 'should return an array of champions that are rank enabled' do
      rank_enabled = champions.rank_enabled
      expect(rank_enabled.instance_of? Array).to eq(true)
    end
  end

  context '#rank_disabled' do
    it 'should return an array of champions that are rank disabled' do
      rank_disabled = champions.rank_disabled
      expect(rank_disabled.instance_of? Array).to eq(true)
    end
  end

  context '#bot_enabled' do
    it 'should return an array of champions that are bot enabled' do
      bot_enabled = champions.bot_enabled
      expect(bot_enabled.instance_of? Array).to eq(true)
    end
  end

  context '#bot_disabled' do
    it 'should return an array of champions that are bot bot_disabled' do
      bot_disabled = champions.bot_disabled
      expect(bot_disabled.instance_of? Array).to eq(true)
    end
  end

  context '#co_op_enabled' do
    it 'should return an array of champions that are co-op enabled' do
      co_op_enabled = champions.co_op_enabled
      expect(co_op_enabled.instance_of? Array).to eq(true)
    end
  end

  context '#co_op_disabled' do
    it 'should return an array of champions that are co-op disabled' do
      co_op_disabled = champions.co_op_disabled
      expect(co_op_disabled.instance_of? Array).to eq(true)
    end
  end
end
