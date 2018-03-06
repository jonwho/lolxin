describe League do
  let(:client)     { Client.new(ENV['API_KEY'], region: :na1) }
  let(:league)     { client.league }
  let(:doublelift) { 20132258 }
  let(:league_id)  { "930faadc-f191-3fc0-b715-79804ef73cfc" }

  describe '#challenger_by_queue' do
    it 'retrieves a LeagueListDto' do
      league_list = league.challenger_by_queue("RANKED_FLEX_SR")
      league_list.instance_variables.each do |iv|
        expect(league_list.instance_variable_get(iv)).not_to be nil
      end
    end
  end

  describe '#master_by_queue' do
    it 'retrieves a LeagueListDto' do
      league_list = league.master_by_queue("RANKED_FLEX_SR")
      league_list.instance_variables.each do |iv|
        expect(league_list.instance_variable_get(iv)).not_to be nil
      end
    end
  end

  # TODO: 3/5/18 API is broken. API spec says it returns a LeagueListDTO
  # but it only returns the following:
  # `["name", "Taric's Shadehunters"]`
  # leave untested for now
  # describe '#leagues' do
  #   it 'retrieves a list of LeagueListDto' do
  #     league_lists = league.leagues(league_id)
  #     league_lists.each do |league_list|
  #       league_list.instance_variables.each do |iv|
  #         expect(league_list.instance_variable_get(iv)).not_to be nil
  #       end
  #     end
  #   end
  # end

  describe '#positions_by_summoner' do
    it 'retrieves a list of LeaguePositionDto' do
      league_positions = league.positions_by_summoner(doublelift)
      league_positions.each do |league_position|
        expect(league_position.rank).not_to be(nil)
        expect(league_position.queue_type).not_to be(nil)
        expect(league_position.hot_streak).not_to be(nil)
        # mini_series not always present in a response
        # expect(league_position.mini_series).not_to be(nil)
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
