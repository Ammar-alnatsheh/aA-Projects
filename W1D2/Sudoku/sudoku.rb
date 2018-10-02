class Sudoku

  def initialize(filename = nil)
    if filename == nil
      # create a board with random numbers
      @board = create_board()
    else
      # get board from a text file
      @board = load_board(filename)
    end
  end

  def create_board
    grid = Array.new(9){Array.new(9){0}}
  end

  def load_board(filename)
    # read premade board from a file
    grid = []
    File.open(filename).each_line do |line|
      number = line.split(//)
      grid << number
    end
    grid
    convert_to_integer(grid)
  end

  def convert_to_integer(grid)
    result = []
    grid.each do |line|
      row = []
      line.each do |char|
        row << char.to_i
      end
      result << row
    end
    result
  end

  def render_board
    system("clear")
    puts "    1  2  3     4  5  6     7  8  9"
    puts "-----------------------------------"
    i = 0
    while i < 9
      j = 0
      line = "#{i+1}| "
      while j < 9
        if (@board[i][j] == 0)
          line += "   "
        else
          line += " #{@board[i][j]} "
        end
        if ( j == 2 || j == 5)
          line += " | "
        end
        j += 1
      end
      puts line +"|"
      if ( i == 2 || i == 5)
        puts "-----------------------------------"
      end
      i += 1
    end
    puts "-----------------------------------"
    puts ""
  end

def play
  input = "play"
  until( input == "exit" || won? )
    render_board
    input = get_input
  end
end

  def won?
    # count each row
    i = 0
    while i < 9
      if ( @board[i].reduce(:+) != 45 )
        p "#{i}    #{@board[i].reduce(:+)}"
        return false
      end
      i += 1
    end
    # count each column
    i = 0
    while i < 9
      j = 0
      sum_col = 0
      while j < 9
        sum_col += @board[j][i]
        j += 1
      end
      if ( sum_col != 45)
        p "#{i}    #{sum_col}"
        return false
      end
      i += 1
    end
    puts "\nCongragulations you Won!"
    puts ""
    return true
  end

  def get_input
    begin
      puts "Enter the cell location as row,col= value\nEx: 4,6=7  , put value as 0 to clear that cell.\nTo exit to stop playing."
      input = gets.chomp
      if (input == "exit")
        return 'exit'
      else
        row = (input[0].to_i)-1
        col = (input[2].to_i)-1
        value = input[4].to_i
        @board[row][col] = value
      end
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Sudoku.new('test.txt')
  game.play
end
