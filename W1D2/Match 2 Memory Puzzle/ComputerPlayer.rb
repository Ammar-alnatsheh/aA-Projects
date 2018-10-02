class ComputerPlayer

  def initialize(num_of_cards)
    @grid = Array.new(Math.sqrt(num_of_cards).to_i+1) {[]}
    counter = 0
    i = 0
      while i < (Math.sqrt(num_of_cards).to_i)+1
        j =0
        while j < (Math.sqrt(num_of_cards).to_i)+1
          if counter < num_of_cards
          @grid[i][j] = 0
        else
          @grid[i][j] = 1
        end
          counter += 1

          j+=1
        end
        i+=1
      end
    @previous_guess = nil
    @second_guess = nil
  end

  def make_guess()
    row = rand(0...@grid.length)
    col = rand(0...@grid[0].length)
      while @grid[row][col] != 0
        row = rand(0...@grid.length)
        col = rand(0...@grid[0].length)
      end
    if @previous_guess = nil
      @previous_guess = [row,col]
    else
      @second_guess = [row,col]
    end
    [row,col]
  end


  def matching_result(previous_card,previous_guess,second_card,second_guess)

      if previous_card == second_card
        @grid[second_guess[0]][second_guess[1]] = 1
        @grid[previous_guess[0]][previous_guess[1]] = 1
      end

  end


end
