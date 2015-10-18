require 'spec_helper'


describe Lolxin do
  let(:client) { client = Client.new ENV['API_KEY'] }
  let(:region_champions) { region_champions = client.region_champions }
  let(:static_champions) { static_champions = client.static_champions }

  it 'has a version number' do
    expect(Lolxin::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end

describe Lolxin::Champions do
  let(:client) { client = Client.new ENV['API_KEY'] }
  let(:region_champions) { region_champions = client.region_champions }
  let(:static_champions) { static_champions = client.static_champions }
  it 'should return API version' do
    expect(Lolxin::Champions.api_version).to eq('v1.2')
  end
end

describe Lolxin::Champion do
  let(:client) { client = Client.new ENV['API_KEY'] }
  let(:region_champions) { region_champions = client.region_champions }
  let(:static_champions) { static_champions = client.static_champions }
  it 'should have an ID' do
    Lolxin::Champion.new( ENV['API_KEY'], 'Thresh' ).id.should_not be_nil
  end
end

describe Lolxin::Client do
  let(:client) { client = Client.new ENV['API_KEY'] }
  let(:region_champions) { region_champions = client.region_champions }
  let(:static_champions) { static_champions = client.static_champions }
  it 'should default to NA region' do
    @client = Lolxin::Client.new ENV['API_KEY']
    expect(@client.region).to eq('na')
  end
end

