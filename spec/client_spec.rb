require 'spec_helper'

describe Lolxin::Client do
  let(:client) { client = Lolxin::Client.new ENV['API_KEY'] }

  context '#new' do
    it 'should set region to na if options hash missing region key' do
      expect(client.region).to eq('na')
    end

    it 'should set region to kr with options hash' do
      @client = Lolxin::Client.new ENV['API_KEY'], :region => 'kr'
      expect(@client.region).to eq('kr')
    end

    it 'should set region to br with options hash' do
      @client = Lolxin::Client.new ENV['API_KEY'], :region => 'br'
      expect(@client.region).to eq('br')
    end
  end
end
