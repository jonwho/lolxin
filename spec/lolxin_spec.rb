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


