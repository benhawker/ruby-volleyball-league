class Team

  attr_reader :players

  MAX_PLAYERS = 10
  MIN_PLAYERS = 7

  def initialize
    @players = []
  end

  def add_player(player)
    raise "Team at max size already" if @players.length > 9
    raise "Player is already part of another team" if player.free_agent == false

    player.free_agent = false
    @players << player
    player.team = self
  end

  def valid_team?
    valid_size? && valid_gender_mix?
  end

  def valid_size?
    number_of_players >= (MIN_PLAYERS) && number_of_players <= (MAX_PLAYERS)
  end

  def valid_gender_mix?
    raise "Male count too low" if male_count < 2
    raise "Female count too low" if female_count < 2

    true if male_count >= 2 || female_count >= 2
  end

  private

  def number_of_players
    @players.size
  end

  def male_count
    @players.select { |player| player.male? }.size
  end

  def female_count
    @players.select { |player| player.male? == false }.size
  end

end