require "byebug"

class Board

  def initialize(cards)
    @cards = cards
    @grid = Array.new(Math.sqrt(cards.length).to_i+1) {[]}
    populate
  end

  def populate
    #should fill the board with a set of shuffled Card pairs
    cards = @cards.shuffle
    counter = 0
    i = 0
      while i < (Math.sqrt(cards.length).to_i)+1
        j =0
        while j < (Math.sqrt(cards.length).to_i)+1
          @grid[i][j] = cards[counter]
          counter += 1
          return if counter == cards.length
          j+=1
        end
        i+=1
      end
  end


  def render
    # should print out a representation of the Board's current state
    puts "\n\n"
    puts "*  *  *  *  *  *  *  *  *  *"
    #byebug
    @grid.each do |row|
      col = ""
      row.each do |el|
        if el.face_up
          print "| #{el.value.to_s} |"
        else
          print "|   |"
        end
      end
      puts "\n*  *  *  *  *  *  *  *  *  *"
    end
    puts "\n"
  end


  def won?
    #should return true if all cards have been revealed.
    @cards.all? { |card| card.face_up == true }
  end


  def reveal(pos)
    # should reveal a Card at guessed_pos (unless it's already face-up, in which case
    #  the method should do nothing).It should also return the value of the card it
      #  revealed (you'll see why later).
    card = @grid[pos[0]][pos[1]]
    if card.face_down
      card.reveal
      return card.value
    end
    nil
  end

  def hide_cards(pos1,pos2)
    @grid[pos1[0]][pos1[1]].hide
    @grid[pos2[0]][pos2[1]].hide
  end
end
