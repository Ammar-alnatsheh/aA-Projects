require_relative "Pieces"
require_relative "Board"
require_relative "Player"

class Game
  attr_accessor :board, :display, :players, :current_player

  def initialize
    @board = board
    @display = display
    @players = Hash.new
    @current_player =
  end

  def play

  end

  private
  def notify_players

  end

  def swap_turn!

  end
end


class Display
  attr_accessor :board, :cursor

  def initialize(board)
    @board = board
    @cursor
  end

  def render

  end
end

class Cursor
  attr_accessor :cursor_pos, :board, :selected

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @selected
  end

  def get_input

  end

  def toggle_selected

  end

private
  def handle_key(key)
  end

  def read_char

  end

  def update_pos(diff)
  end
end
