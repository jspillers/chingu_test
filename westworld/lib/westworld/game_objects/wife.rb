class Wife < Chingu::GameObject  
  attr_accessor :bladder_volume

  trait :timer

  def on_message(sender, message, meta)
  end
end
