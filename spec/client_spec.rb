require 'spec_helper'

describe Lolxin::Client do
  let(:client) { client = Client.new ENV['API_KEY'] }
  let(:region_champions) { region_champions = client.region_champions }
  let(:static_champions) { static_champions = client.static_champions }

  it 'should default to NA region' do
    @client = Lolxin::Client.new ENV['API_KEY']
    expect(@client.region).to eq('na')
  end
end
