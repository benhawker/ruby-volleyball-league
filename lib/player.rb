class Player

  attr_reader :free_agent

  def initialize
    @free_agent = true
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

  def free_agent?
    @free_agent
  end

  def suspended?

  end

end