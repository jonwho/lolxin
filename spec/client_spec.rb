require 'spec_helper'

describe Lolxin::Client do
  let(:client) { client = Lolxin::Client.new ENV['API_KEY'] }
  let(:region_champions) { region_champions = client.region_champions }
  let(:static_champions) { static_champions = client.static_champions }

  it 'should default to NA region' do
    expect(client.region).to eq('na')
  end

  it 'should set region to KR' do
    @client = Lolxin::Client.new ENV['API_KEY'], :region => 'kr'
    expect(@client.region).to eq('kr')
  end

  it 'should set region to BR' do
    @client = Lolxin::Client.new ENV['API_KEY'], :region => 'br'
    expect(@client.region).to eq('br')
  end
end
