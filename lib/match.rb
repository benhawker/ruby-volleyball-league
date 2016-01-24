class Match

  attr_reader :team_one, :team_two

  def initialize(team_one, team_two)
    @team_one = team_one
    @team_two = team_two
  end

  def match_conditions_are_met?

  end

  private

  def check_player_is_free_agent(team)
    team.players.each
  end

end