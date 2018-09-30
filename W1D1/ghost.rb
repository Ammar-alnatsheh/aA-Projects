class Ghost

  attr_accessor :fragment

  def initialize(dictionary = nil)
    @fragment = ""

    if dictionary == nil
      @dictionary = File.readlines("dictionary.txt")
    else
      @dictionary = dictionary
    end

    p "Welcome to Ghost game, Type the first player name and press enter"
    name = gets.chomp
    @player_1 = Player.new(name)
    p "Type the second player name and press enter"
    name = gets.chomp
    @player_2 = Player.new(name)

    @losses = {
      @player_1 => 0,
      @player_2 => 0
    }

    @current_player = @player_1
    @previous_player = @player_2
  end

  def play_round()
    while @losses[@player_1] < 5 && @losses[@player_2] < 5
      player = current_player
      take_turn(player)
      next_player!
    end
    if @losses[@player_1] < @losses[@player_2]
      p "#{@player_1.name} win, #{@player_2.name} Ghost"
    else
      p "#{@player_2.name} win, #{@player_1.name} Ghost"
    end
  end

  def current_player()
    @current_player
  end

  def previous_player()
    @previous_player
  end

  def next_player!()
    @current_player,@previous_player = @previous_player,@current_player
  end

  def take_turn(player)
    p "its #{player.name} turn, letters has been typed #{@fragment}"
    guess = player.guess
    system("clear")
    if valid_play?(guess)
      @fragment << guess
    else
      player.alert_invalid_guess
      @losses[current_player] = @losses[current_player] + 1
    end
  end

  def valid_play?(string)
    @dictionary.each do |word|
      return false if (@fragment+string).chars.sort.uniq == word.chars.sort.uniq
    end
    return true
  end

end


class Player

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    p "enter a single letter, incase of a word we will take the first letter"
    l = gets.chomp
    l[0].downcase if l[0] !=nil
  end

  def alert_invalid_guess
    p "that was an invalid guess"
  end

end

if __FILE__ == $PROGRAM_NAME
  system("clear")
  game = Ghost.new
  game.play_round
end
