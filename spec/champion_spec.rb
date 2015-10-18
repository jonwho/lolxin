require 'spec_helper'

describe Lolxin::Champion do
  let(:client) { client = Client.new ENV['API_KEY'] }
  let(:region_champions) { region_champions = client.region_champions }
  let(:static_champions) { static_champions = client.static_champions }

  it 'should have an ID' do
    Lolxin::Champion.new( ENV['API_KEY'], 'Thresh' ).id.should_not be_nil
  end
end
