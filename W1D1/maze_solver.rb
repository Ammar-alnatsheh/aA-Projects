class Maze_Solver

  def initialize(filename)
    @maze = load_map(filename)
    @start_idx = find_char("S")
    @end_idx = find_char("E")
    @path = find_path
  end

  def load_map(filename)
    map = []
    File.open(filename).each_line do |line|
      chars = line.split(//)
      map << chars
    end
    map
  end

  def find_char(char)
    @maze.each_with_index do |row, x|
      row.each_with_index do |col, y|
        return [x,y] if ( @maze[x][y] == char )
      end
    end
  end

  def find_path
  end

end
