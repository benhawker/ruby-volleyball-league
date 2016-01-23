require 'player'

describe Player do

	let(:male) { Player::Male.new }
	let(:female) { Player::Female.new }

	context "gender" do
		it "creates a male player" do
			expect(male.male?).to be true
		end

		it "creates a female player" do
			expect(female.male?).to be false
		end
	end

	context "suspended" do
		it "is not suspended when created" do
			expect(male.suspended?).to be false
		end
	end

	context "free agent" do
		it "is a free agent when created" do
			expect(male.free_agent?).to be true
		end
	end

end