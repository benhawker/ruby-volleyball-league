class Player

  def self.male
    Male.new
  end

  def self.female
    Female.new
  end

  class Male < Player
    def male?
      true
    end

  end

  class Female < Player
    def male?
      false
    end

  end

  def suspended?

  end

  def suspend(number_of_games)

  end

end