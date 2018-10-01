require 'byebug'
class Maze_Solver

  attr_reader :path, :start_idx, :end_idx, :maze

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
      return [start_idx[0] , start_idx[1]]
    end

    #1
    x = start_idx[0] - 1
    y = start_idx[1]
    if ( valid_position( x , y , grid) )
      grid[x][y] = "X"
      path = find_path(x , y, grid)
      unless ( path.nil? )
        return [[x,y]] + path
      end
    end

    #2
    x = start_idx[0] + 1
    y = start_idx[1]
    if ( valid_position( x , y , grid) )
      grid[x][y] = "X"
      path = find_path(x , y, grid)
      unless ( path.nil? )
        return [[x,y]] + path
      end
    end
    #3
    x = start_idx[0]
    y = start_idx[1] - 1
    if ( valid_position( x , y , grid) )
      grid[x][y] = "X"
      path = find_path(x , y, grid)
      unless ( path.nil? )
        return [[x,y]] + path
      end
    end
    #4
    x = start_idx[0]
    y = start_idx[1] + 1
    if ( valid_position( x , y , grid) )
      grid[x][y] = "X"
      path = find_path(x , y, grid)
      unless ( path.nil? )
        return [[x,y]] + path
      end
    end
    #5
    x = start_idx[0] + 1
    y = start_idx[1] + 1
    if ( valid_position( x , y , grid) )
      grid[x][y] = "X"
      path = find_path(x , y, grid)
      unless ( path.nil? )
        return [[x,y]] + path
      end
    end
    #6
    x = start_idx[0] - 1
    y = start_idx[1] - 1
    if ( valid_position( x , y , grid) )
      grid[x][y] = "X"
      path = find_path(x , y, grid)
      unless ( path.nil? )
        return [[x,y]] + path
      end
    end
    #7
    x = start_idx[0] - 1
    y = start_idx[1] + 1
    if ( valid_position( x , y , grid) )
      grid[x][y] = "X"
      path = find_path(x , y, grid)
      unless ( path.nil? )
        return [[x,y]] + path
      end
    end
    #8
    x = start_idx[0] + 1
    y = start_idx[1] - 1
    if ( valid_position( x , y , grid) )
      grid[x][y] = "X"
      path = find_path(x , y, grid)
      unless ( path.nil? )
        return [[x,y]] + path
      end
    end


  end

  def valid_position( x , y , grid)
    #make sure the x,y posion in the grid borders and its empty cell
    x > -1 && y > -1 && x < grid[0].length && y < grid.length && grid[x][y] == " "
  end

end
