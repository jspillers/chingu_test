class Wife < BaseObject
  attr_accessor :bladder_volume, :x, :y

  traits :timer, :vocal

  def initialize(opts)
    super(opts)
    @animation = Chingu::Animation.new(file: "wife_43x118.png", delay: 1000)
    @animation.frame_names = { default: 0..0, cooking: 1..1 }
    @frame_name = :cooking
  end

  def update
    @image = @animation[@frame_name].image
  end

end
