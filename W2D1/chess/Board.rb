class Board
  attr_accessor :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    @sentinel
    
    # start_board a methos to replace all picese on the borad
    start_board
  end

  def [](pos)
  end

  def []=(pos, value)
  end

  def move_piece(color, start_pos, end_pos)
  end

  def valid_pos?(pos)

  end

  def add_piece(piece, pos)

  end

  def checkmate?(color)

  end

  def find_king(color

  end

  def pieces

  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end

  def start_board()

  end
end
