class Player

  attr_accessor :free_agent, :suspended

  def initialize
    @free_agent = true
    @suspended = false
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
    @suspended
  end

end