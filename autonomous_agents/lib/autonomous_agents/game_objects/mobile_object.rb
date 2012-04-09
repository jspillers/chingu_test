class MobileObject < BaseObject
  attr_accessor :velocity,     # vector2d 
                :position,     # vector2d
                :heading,      # a normalized vector pointing in the direction the entity is heading. 
                :side,         # a vector perpendicular to the heading vector
                :mass,         # the maximum speed this entity may travel at.
                :max_speed,    # speed limit
                :max_force,    # the maximum force this entity can produce to power itself (think rockets and thrust)
                :max_turn_rate # the maximum rate (radians per second)this vehicle can rotate         

  def initialize(opts)
    super(opts)
  end

  def face_position(target)
    # normalize target - @position
    #Vector2D toTarget = Vec2DNormalize(target - m_vPos);

    #//first determine the angle between the heading vector and the target
    #double angle = acos(m_vHeading.Dot(toTarget));

    #//return true if the player is facing the target
    #if (angle < 0.00001) return true;

    #//clamp the amount to turn to the max turn rate
    #if (angle > m_dMaxTurnRate) angle = m_dMaxTurnRate;
    #
    #//The next few lines use a rotation matrix to rotate the player's heading
    #//vector accordingly
    #C2DMatrix RotationMatrix;
    #
    #//notice how the direction of rotation has to be determined when creating
    #//the rotation matrix
    #RotationMatrix.Rotate(angle * m_vHeading.Sign(toTarget));	
    #RotationMatrix.TransformVector2Ds(m_vHeading);
    #RotationMatrix.TransformVector2Ds(m_vVelocity);

    #//finally recreate m_vSide
    #m_vSide = m_vHeading.Perp();

    #return false;
  end

  def set_heading(new_heading)
    # make sure new heading length sq - 1.0 is less than 0.00001
    return unless new_heading.length_squared - 1.0 < 0.00001

    @heading = new_heading

    # the side vector must always be perpendicular to the heading
    @side = new_heading.perp
  end

end
