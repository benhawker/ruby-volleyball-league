require 'match'
require 'team'
require 'player'

describe Match do

  let(:male) { Player::Male.new }
  let(:female) { Player::Female.new }
  let(:team_one) { Team.new }
  let(:team_two) { Team.new }
	let(:match) { Match.new(team_one, team_two) }

	describe "#match_conditions_are_met?" do
		it "returns false if the match conditions are not met" do
			expect(match.match_conditions_are_met?).to eq false
		end

		it "returns true if the match conditions are met" do
			expect(match.match_conditions_are_met?).to eq true
		end
	end

	describe "#any_players_suspended?" do
		it "returns true if any players are suspended in either team" do
			player = Player.new
			player.suspended = true
			team_one.players << player
			expect(match.send(:any_players_suspended?)).to be true
		end

		it "returns true if any players are suspended in either team" do
			player = Player.new
			team_one.players << player
			expect(match.send(:any_players_suspended?)).to be false
		end
	end

end