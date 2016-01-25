require 'league'
require 'player'

describe League do

	let(:league) { League.new }
	let(:player) { Player::Male.new }

	describe "#suspend_player" do
		it "marks player as being suspended" do
			league.suspend_player(player)
			expect(player.suspended).to be true
		end
	end

end