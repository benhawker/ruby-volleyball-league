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
			expect(match.match_conditions_are_met?).to be false
		end

		xit "returns true if the match conditions are met" do
			expect(match.match_conditions_are_met?).to be true
		end
	end

	describe "#both_teams_valud" do
		it "returns false if eiter of the teams are not valid" do
			expect(match.both_teams_valid?).to be false
		end

		xit "returns true if both teams are valid" do
			expect(match.both_teams_valid?).to be true
		end

	end

	describe "#any_players_suspended?" do
		it "returns true if any players are suspended in either team" do
			player = Player::Male.new
			player.suspended = true
			team_one.players << player
			expect(match.send(:any_players_suspended?)).to be true
		end

		it "returns true if any players are suspended in either team" do
			player = Player::Male.new
			team_one.players << player
			expect(match.send(:any_players_suspended?)).to be false
		end
	end

end