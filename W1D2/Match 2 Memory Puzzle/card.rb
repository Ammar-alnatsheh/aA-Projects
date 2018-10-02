class Card
  attr_accessor :value, :face_up, :face_down

  def initialize(value)
    @value = value
    @face_up = false
    @face_down = true
  end

  def hide
    @face_up , @face_down = @face_down, @face_up
  end

  def reveal
    @face_up , @face_down = @face_down, @face_up
  end


  def ==(card)
    card.value == @value
  end

  def to_s
    @value.to_s
  end

end
