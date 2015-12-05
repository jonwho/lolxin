require 'spec_helper'

describe Lolxin::Champion do
  let(:client) { client = Client.new ENV['API_KEY'] }
  let(:thresh) { thresh = client.champion 'thresh' }

  it 'should have an ID' do
    Lolxin::Champion.new( ENV['API_KEY'], 'Thresh' ).id.should_not be_nil
  end
end
