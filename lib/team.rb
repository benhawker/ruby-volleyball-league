class Team

	attr_reader :players

	MAX_PLAYERS = 10
	MIN_PLAYERS = 7

	def initialize
		@players = []
	end

	def add_player(player)
		player.free_agent = false
		@players << player
	end

	def valid_team?
		valid_size?
		valid_gender_mix?
	end

	def valid_size?
		number_of_players > (MIN_PLAYERS - 1) && number_of_players < (MAX_PLAYERS + 1)
	end

	def valid_gender_mix?
		male_count = @players.select { |player| player.male? }.size
		female_count = @players.select { |player| player.male? == false }.size

		raise "Male count too low" if male_count < 2
		raise "Female count too low" if female_count < 2
		
		return true if male_count >= 2 || female_count >= 2
	end

	private

	def number_of_players
		@players.length
	end

	def male_female_ratio

	end

end