# PHASE 2
require 'byebug'
def convert_to_int(str)
  begin
    Integer(str)
  rescue
    # raise ArgumentError.new 'Wrong input'
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  begin
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)

  rescue StandardError => e
    if maybe_fruit == 'coffee'
      retry
    end
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    # begin
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    # rescue
      raise 'Year known needs to be 5 year or longer.' if @yrs_known < 5
      raise "Your best friend doesn't have a name?" if @name.length < 1
      raise "Give a favorite pastime!" if @fav_pastime.length < 1
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end

# if $PROGRAM_NAME == __FILE__
#   ruby super_useful.rb
# end
