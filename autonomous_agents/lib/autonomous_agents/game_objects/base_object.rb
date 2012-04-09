class BaseObject < Chingu::GameObject  

  # implemented in child classes
  def on_message(sender, message, meta)
    true
  end

end
