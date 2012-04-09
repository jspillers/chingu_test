class Drone < MobileObject

  traits :timer, :seek

  def initialize(opts)
    super(opts)

    @velocity = Vector2d.new(x, y)
    @heading = Vector2d.new(x, y)
    @side = Vector2d.new(x, y)
    @mass = 0
    @max_speed = 0
    @max_force = 0
    @max_turn_rate = 0
  end

  def update
    # @acceleration = @steering_force / @mass  
    # @velocity += @acceleration * time_elapsed
    # truncate @velocity at @max_speed
    
    # position += @velocity * time_elapsed
    super
  end
end
