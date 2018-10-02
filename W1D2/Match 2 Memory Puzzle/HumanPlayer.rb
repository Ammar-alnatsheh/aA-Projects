class HumanPlayer

  def initialize

  end


  def make_guess()
    p "Type the row numbers starting from 0 Please have it a a whole number no fraction"
    row = gets.chomp.to_i
    p "Type the colomn numbers starting from 0 Please have it a a whole number no fraction"
    col = gets.chomp.to_i
    return [row,col]
  end

  def matching_result(previous_card,previous_guess,second_card,second_guess)
  end

end
