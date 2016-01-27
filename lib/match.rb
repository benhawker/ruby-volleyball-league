class Match

  attr_reader :team_one, :team_two

  def initialize(team_one, team_two)
    @team_one = team_one
    @team_two = team_two
  end

  def match_conditions_are_met?
    !any_players_suspended?
    both_teams_valid?
  end

  def both_teams_valid?
    team_one.valid_team? && team_two.valid_team?
  end

  private

  def any_players_suspended?
    look_for_suspended_players(team_one) && look_for_suspended_players(team_two)
  end

  def look_for_suspended_players(team)
    team.players.all? { |player| player.suspended == true }
  end

end