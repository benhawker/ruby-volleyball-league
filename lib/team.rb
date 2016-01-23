class Team

	attr_reader :players

	MAX_PLAYERS = 10
	MIN_PLAYERS = 7

	def initialize
		@players = []
	end

	def add_player(player)
		@players << player
	end

	private

	def valid_team?

	end

	def number_of_players

	end

	def male_female_ratio

	end

end