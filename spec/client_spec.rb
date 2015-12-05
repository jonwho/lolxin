require 'spec_helper'

describe Lolxin::Client do
  let(:client) { client = Lolxin::Client.new ENV['API_KEY'] }
  let(:regions) { regions = Lolxin::Region::REGIONS }

  describe '#new' do
    context 'no region supplied' do
      it 'should set region to na' do
        expect(client.region).to eq('na')
      end
    end

    context 'region supplied' do
      # couldn't use regions here because can only use let variables inside it-scopes
      Lolxin::Region::REGIONS.each do |key, value|
        it "should set region to #{value}" do
          @client = Lolxin::Client.new ENV['API_KEY'], :region => value
          expect(regions[@client.region.upcase.to_sym]).not_to be_nil
        end
      end
    end
  end
end
