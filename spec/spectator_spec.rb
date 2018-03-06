describe Spectator do
  let(:client)      { Client.new(ENV['API_KEY'], region: :kr) }
  let(:spectator)   { client.spectator }
  let(:doublelift)  { 20132258 }

  describe '#by_summoner' do
    it 'retrieves current game info the summoner is currently playing in' do
      current_games = spectator.by_summoner(doublelift)
      # NOTE: test only works if the player is in an active game
      expect(current_games.values.any?(&:nil?)).to be(false)
    end
  end

  describe '#featured_games' do
    it 'retrieves a list of FeaturedGameInfo' do
      featured_games = spectator.featured_games
      expect(featured_games.values.any?(&:nil?)).to be(false)
    end
  end
end
