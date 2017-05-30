describe League do
  let(:client)      { Client.new(ENV['API_KEY'], region: :na1) }
  let(:league)      { client.league }
  let(:doublelift)  { 20132258 }

  describe '#challenger_by_queue' do
    it 'retrieves a LeagueListDTO' do
      league_list = league.challenger_by_queue("RANKED_FLEX_SR")
      expect(league_list.values.any?(&:nil?)).to be(false)
    end
  end

  describe '#league_by_summoner' do
    it 'retrieves a list of LeagueListDTO' do
      league_lists = league.league_by_summoner(doublelift)
      league_lists.each do |league_list|
        expect(league_list.values.any?(&:nil?)).to be(false)
      end
    end
  end

  describe '#master_by_queue' do
    it 'retrieves a LeagueListDTO' do
      league_list = league.master_by_queue("RANKED_FLEX_SR")
      expect(league_list.values.any?(&:nil?)).to be(false)
    end
  end

  describe '#positions_by_summoner' do
    it 'retrieves a list of LeaguePositionDTO' do
      league_positions = league.positions_by_summoner(doublelift)
      league_positions.each do |league_position|
        expect(league_position.rank).not_to be(nil)
        expect(league_position.queue_type).not_to be(nil)
        expect(league_position.hot_streak).not_to be(nil)
        # mini_series not always present in a response
        #expect(league_position.mini_series).not_to be(nil)
        expect(league_position.wins).not_to be(nil)
        expect(league_position.veteran).not_to be(nil)
        expect(league_position.losses).not_to be(nil)
        expect(league_position.player_or_team_id).not_to be(nil)
        expect(league_position.league_name).not_to be(nil)
        expect(league_position.player_or_team_name).not_to be(nil)
        expect(league_position.inactive).not_to be(nil)
        expect(league_position.fresh_blood).not_to be(nil)
        expect(league_position.tier).not_to be(nil)
        expect(league_position.league_points).not_to be(nil)
      end
    end
  end
end
