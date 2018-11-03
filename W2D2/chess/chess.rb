require_relative "Board"
require_relative "Player"
require_relative "cursor"
require 'colorize'
# require_relative "Display"

class Game
  attr_accessor :board, :display, :players, :current_player

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = Hash.new
    @current_player
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
    @cursor = Cursor.new([0,0], @board)
  end

  def render


      system("clear")
      @board.rows.each_with_index do |row, idx|
        row.each_with_index do |piece, jdx|
          color = piece.is_a?(NullPiece) ? :white : (piece.color).to_sym
          if (idx + jdx).odd?
            print piece.symbol.colorize(color: color, background: :blue)
          else
            print piece.symbol.colorize(color: color, background: :red)
          end
        end
        print "\n"
      end

    end

end

if __FILE__ == $PROGRAM_NAME
game = Game.new()
system("clear")
game.display.render

end
