# We want our dear user to be able to call 
#convert_to_int with no error being raised on invalid input. Update convert_to_int to rescue any errors and return nil 
#if our argument cannot be converted.
#If we are handling the error thrown by Integer(arg), 
#which StandardError subclass should we be catching? 
#Next, update convert_to_int again to only rescue the correct exception type.
# NB: rescue only rescues StandardError and its subclasses. Any other Exception subclass is a system error and implies that something rather serious has gone wrong and our code should stop executing.

# PHASE 2
def convert_to_int(str)
  begin 

  num = Integer(str)
  rescue ArgumentError => err
    puts "#{str} is not an integer, obviously. That's impossible"
  ensure 
    num ||= -1
  end
end

# # PHASE 3
# Phase 3: Make friendly monster (maybe) let you try again
# Overview
# Sometimes when an error is thrown we would like to try the failing operation 
# again (hopefully with different input :wink:). This is often the case with user 
#   input and text parsing. Let's try to make friendly monster happy by allowing us 
# to retry feeding it a fruit when certain errors are thrown.

# # Instructions
# # Friendly monster is really friendly and really likes coffee, so he'd like to 
# give us another try, but only when we give him "coffee".

# First, handle the errors being thrown by #reaction in #feed_me_a_fruit.

# Note that #reaction throws errors receiving an argument that is not in FRUITS. 
# Next, let's differentiate the errors thrown so our calling function, #feed_me_a_fruit
#  can try to feed friendly monster again, but only when they've given it coffee.

# Now that we have different error types being thrown by #reaction we can do a 
# little conditional logic in #feed_me_a_fruit to retry the failing block of code 
# # again, but only if it is a coffee-related error.

# Recap
# Being able to rescue and retry failing code gives us even more control over 
# the flow of our program. Handling different errors separately gives us even more control.


FRUITS = ["apple", "banana", "orange"]

class IsCoffee < StandardError
  def error
    "since you gave me a coffee you get another shot"
  end
end

class NotFruit < StandardError
  def error
    "Bruh this ain't fruit. Go away"
  end
end


def reaction(maybe_fruit)
    if FRUITS.include? maybe_fruit
      puts "OMG, thanks so much for the #{maybe_fruit}!"
    elsif maybe_fruit == "coffee"
      raise IsCoffee
    else
      raise NotFruit
    end

  # rescue ArgumentError if maybe_fruit== "coffee"
  #     puts "try another fruit"
  #     gets.chomp = maybe_fruit
  #     retry
  # else 
  #   raise "Wrong food im mad"
  # end
end


# def reaction(maybe_fruit)
#   begin
#     if FRUITS.include? maybe_fruit
#       puts "OMG, thanks so much for the #{maybe_fruit}!"
#     else raise ArgumentError
#     end
#   rescue ArgumentError if maybe_fruit== "coffee"
#       puts "try another fruit"
#       gets.chomp = maybe_fruit
#       retry
#   else 
#     raise "Wrong food im mad"
#   end
# end

def feed_me_a_fruit 
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
begin
 
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
rescue IsCoffee => e
  puts e.error
  retry
rescue NotFruit => e
  puts e.error
end  
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
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


