def eight_queens_problem
  grid = empty_grid
  # choose the queen location randomly for each row
  i = 0
  while i < 8
    j = rand(0..7)
    while grid[i][j] != 0
      j = rand(0..7)
    end
    grid[i][j] = :Q
    grid = fill_grid(grid,i,j)
    # make sure the grid is not full before we finish putting queens
    #otherwise our randomly selection is going to no where and we have to start over
    if i < 7
      if grid[i+1].count(0) == 0
        i = -1
        grid = empty_grid
      end
    end
    i+=1
  end
   grid
end


def fill_grid(grid,row,col)
  # fill the grid horizantal and vertical
  i = row
  while i < 8
    j=0
    while j< 8
      if i == row || j == col
        grid[i][j] = 1 if grid[i][j] != :Q
      end
      j+=1
    end
    i+=1
  end
# # fill the grid diagnoal
i = row + 1
j= col + 1
  while i < 8 && j < 8
    grid[i][j] = 1
    i+=1
    j+=1
  end
  i = row + 1
  j= col - 1
  while i < 8 && j > 0
    grid[i][j] = 1
    i+=1
    j-=1
  end
  grid
end

def empty_grid
  grid = [
            [0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0]
          ]
end
