require 'player'
require 'team'

describe Team do

  let(:male) { Player::Male.new }
  let(:female) { Player::Female.new }

  describe "#add_player" do
    let(:team) { nine_player_team }

    it "adds the player to the Team.players array" do
      team.add_player(male)
      expect(team.players).to include male
    end

    it "sets player.free_agent to false if the player is added" do
      team.add_player(male)
      expect(male.free_agent).to be false
    end

    it "raises an exception if the team would be made invalid by the new player" do
      team.add_player(female)
      expect { team.add_player(male) }.to raise_error "Team at max size already"
    end

    it "raises an exception if the player is already part of another team" do
      male.free_agent = false
      expect { team.add_player(male) }.to raise_error "Player is already part of another team"
    end

    it "adds the team to player" do
      team.add_player(male)
      expect(male.team).to eq team
    end
  end

  describe "#valid_size?" do
    let(:team) { nine_player_team }

    it "returns true if size is 7" do
      expect(team.valid_size?).to be true
    end

    it "returns false if size is 2" do
      team = Team.new
      team.players << male
      team.players << female
      expect(team.valid_size?).to be false
    end

    it "returns true if size is 10" do
      team.add_player(female)
      expect(team.valid_size?).to be true
    end
  end

  describe "#valid_gender_mix?" do
    let(:team) { nine_player_team }
    let(:male_two) { Player::Male.new}
    let(:female_two) { Player::Female.new }

    it "returns true if team has at least 2 males & 2 females" do
      expect(team.valid_gender_mix?).to be true
    end

    it "returns false if team has only 1 male player" do
      team = Team.new
      team.add_player(male)
      team.add_player(female)
      team.add_player(female_two)
      expect { team.valid_gender_mix? }.to raise_error "Male count too low"
    end

    it "returns false if team has only 1 female player" do
      team = Team.new
      team.add_player(male)
      team.add_player(male_two)
      team.add_player(female)
      expect { team.valid_gender_mix? }.to raise_error "Female count too low"
    end
  end

  describe "#valid_team?" do
    let(:team) { nine_player_team }
    
    it "returns true if size and gender mix is ok" do
      expect(team.valid_team?).to be true
    end

    it "returns false if size is ok but gender mix is not" do
      team = Team.new
      7.times { team.players << Player::Male.new }
      expect { team.valid_team? }.to raise_error "Female count too low"
    end

    it "returns false if size is out of limits but gender mix is ok" do
      7.times { team.players << Player::Male.new }
      7.times { team.players << Player::Female.new }
      expect(team.valid_team?).to be false
    end
  end

end