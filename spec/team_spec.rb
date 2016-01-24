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

		it "sets player.free_agent to false if the player is added" do
			team.add_player(male)
			expect(male.free_agent).to be false
		end

		it "raises an exception if the team would be made invalid by the new player" do
			8.times { team.add_player(male) }
			2.times { team.add_player(female) }
			expect { team.add_player(female) }.to raise_error "XXX"
		end
	end

	describe "#valid_size?" do
		it "returns true if size is 7" do
			7.times { team.add_player(male) }
			expect(team.valid_size?).to be true
		end

		it "returns false if size is 6" do
			6.times { team.add_player(male) }
			expect(team.valid_size?).to be false
		end

		it "returns false if size is 11" do
			11.times { team.add_player(male) }
			expect(team.valid_size?).to be false
		end
	end

	describe "#valid_gender_mix?" do
		it "returns true if team has at least 2 males & 2 females" do
			2.times { team.add_player(male) }
			2.times { team.add_player(female) }
			expect(team.valid_gender_mix?).to be true
		end

		it "returns false if team has only 1 male player" do
			1.times { team.add_player(male) }
			2.times { team.add_player(female) }
			expect { team.valid_gender_mix? }.to raise_error "Male count too low"
		end

		it "returns false if team has only 1 female player" do
			2.times { team.add_player(male) }
			1.times { team.add_player(female) }
			expect { team.valid_gender_mix? }.to raise_error "Female count too low"
		end
	end





end