class Maze_Solver

  attr_accessor :path, :start_idx, :end_idx, :maze

  def initialize(filename)
    @maze = load_map(filename)
    @start_idx = find_char("S")
    @end_idx = find_char("E")
    @path = find_path(@start_idx,@end_idx,@maze)
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

  def find_path(start_idx , end_idx, grid)

    if ( start_idx == end_idx )
      return [end_idx]
    end

    #1
    x = start_idx[0] - 1
    y = start_idx[1]
    if ( valid_position( x , y , grid) )
      new_grid = grid.dup
      # not to put X mark insted of E
      new_grid[x][y] = "X" unless [x,y] == end_idx
      path = find_path([x,y] , end_idx, new_grid)
      unless ( path.nil? )
        return path.unshift([start_idx[0], start_idx[1]] )
      end
    end

    #2
    x = start_idx[0] + 1
    y = start_idx[1]
    if ( valid_position( x , y , grid) )
      new_grid = grid.dup
      # not to put X mark insted of E
      new_grid[x][y] = "X" unless [x,y] == end_idx
      path = find_path([x,y] , end_idx, new_grid)
      unless ( path.nil? )
        return path.unshift([start_idx[0], start_idx[1]] )
      end
    end
    #3
    x = start_idx[0]
    y = start_idx[1] - 1
    if ( valid_position( x , y , grid) )
      new_grid = grid.dup
      # not to put X mark insted of E
      new_grid[x][y] = "X" unless [x,y] == end_idx
      path = find_path([x,y] , end_idx, new_grid)
      unless ( path.nil? )
        return path.unshift([start_idx[0], start_idx[1]] )
      end
    end
    #4
    x = start_idx[0]
    y = start_idx[1] + 1
    if ( valid_position( x , y , grid) )
      new_grid = grid.dup
      # not to put X mark insted of E
      new_grid[x][y] = "X" unless [x,y] == end_idx
      path = find_path([x,y] , end_idx, new_grid)
      unless ( path.nil? )
        return path.unshift([start_idx[0], start_idx[1]] )
      end
    end

    return nil
  end

  def valid_position( x , y , grid)
    #make sure the x,y posion in the grid borders and its empty cell or its End
    (x > 0 && y > 0 && x < grid.length && y < grid[0].length && grid[x][y] == " ") || @end_idx == [x,y]
  end


end
