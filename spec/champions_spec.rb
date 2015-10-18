require 'spec_helper'

describe Lolxin::Champions do
  let(:client) { client = Client.new ENV['API_KEY'] }
  let(:region_champions) { region_champions = client.region_champions }
  let(:static_champions) { static_champions = client.static_champions }

  it 'should return API version' do
    expect(Lolxin::Champions.api_version).to eq('v1.2')
  end
end
