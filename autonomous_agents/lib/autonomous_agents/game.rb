class Game < Chingu::Window
  def initialize
    super
    self.input = { :escape => :exit } # exits example on Escape
    @drone = Drone.create(position: Vector2d.new(x: 200, y: 200), image: Image["spaceship.png"])
  end

  def update
    super
  end
end

Game.new.show
