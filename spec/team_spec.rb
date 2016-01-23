require 'player'
require 'team'

describe Team do

	let(:male) { Player::Male.new }
	let(:female) { Player::Female.new }
	let(:team) { Team.new }

	describe "#add_player" do
		it "adds the player to the Team.players array" do
			team.add_player(male)
			expect(team.players).to include male
		end

		it "raises an exception if the team would be made invalid by the new player" do
			8.times { team.add_player(male) }
			2.times { team.add_player(female) }
			expect { team.add_player(female) }.to raise_error "XXX"
		end
	end





end