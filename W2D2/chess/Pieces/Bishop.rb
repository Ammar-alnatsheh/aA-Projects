require_relative "Piece.rb"
class Bishop < Piece

  def symbol
    ' ♝ '
  end

  def self.move_dirs

  end
end

module Slideable
HORIZONTAL_DIRS = []
DIAGONAL_DIRS = []

  def horizontal_dirs
  end

  def diagonal_dirs

  end

  def moves

  end

private
  def move_dirs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end

end
