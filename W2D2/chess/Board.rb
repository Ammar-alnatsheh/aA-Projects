require_relative "Pieces/Bishop.rb"
require_relative "Pieces/Rook.rb"
require_relative "Pieces/King.rb"
require_relative "Pieces/Knight.rb"
require_relative "Pieces/Queen.rb"
require_relative "Pieces/Pawn.rb"
require_relative "Pieces/NullPiece.rb"


require 'byebug'
class Board
  attr_accessor :rows

  def initialize()
    @sentinel = NullPiece.instance
    @rows = Array.new(8) {Array.new(8){@sentinel}}


    # start_board a methos to replace all picese on the borad
    start_board
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @rows[row][col] = value
  end

  def move_piece(color = nil, start_pos, end_pos)
    raise "there is no piece at start pos" if self[start_pos] == NullPiece
    raise "the piece cannot move to end pos" unless valid_pos?(end_pos)
    self[end_pos] , self[start_pos] = self[start_pos] , self[end_pos]
  end

  def valid_pos?(pos)
    true
  end

  def add_piece(piece, pos)

  end

  def checkmate?(color)

  end

  def find_king(color)

  end

  def pieces

  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end

  def start_board()
    #loop for pawns
    i = 0
    while i < 8
      @rows[1][i] = Pawn.new('black', self, [1, i])
      i +=1
    end
    i = 0
    while i < 8
      @rows[6][i] = Pawn.new('white', self, [6, i])
      i +=1
    end

    #create other pieces besides pawns
    self[[0,0]] = Rook.new('black',self, [0,0])
    self[[0,7]] = Rook.new('black',self, [0,7])
    self[[7,0]] = Rook.new('white',self, [7,0])
    self[[7,7]] = Rook.new('white',self, [7,7])
    self[[0,1]] = Knight.new('black',self, [0,1])
    self[[0,6]] = Knight.new('black',self, [0,6])
    self[[7,1]] = Knight.new('white',self, [7,1])
    self[[7,6]] = Knight.new('white',self, [7,6])
    self[[0,2]] = Bishop.new('black',self, [0,2])
    self[[0,5]] = Bishop.new('black',self, [0,5])
    self[[7,2]] = Bishop.new('white',self, [7,2])
    self[[7,5]] = Bishop.new('white',self, [7,5])
    self[[0,3]] = Queen.new('black',self, [0,3])
    self[[7,3]] = Queen.new('white',self, [7,3])
    self[[0,4]] = King.new('black',self, [0,4])
    self[[7,4]] = King.new('white',self, [7,4])

  end

end
