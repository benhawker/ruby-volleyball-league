class League

	def initialize
		@teams = []
	end

	def suspend_player(player)
		player.suspended = true
	end

end