def nine_player_team
  team = Team.new
  4.times { team.players << Player::Male.new }
  5.times { team.players << Player::Female.new }
  
  return team
end

