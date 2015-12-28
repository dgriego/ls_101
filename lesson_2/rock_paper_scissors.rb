#
# Rock Paper Scissors
#

CHOICES = %w(r p s)

puts "Welcome to Rock, Paper, Scissors!"
puts "you have begun a battle with machine!"

def display_winning_message(player_choice)
  case player_choice
  when "r" then puts "Rock, very unfortunately, destroys Scissors!"
  when "p" then puts "Paper gently wraps and beats Rock!"
  when "s" then puts "Scissors nom nom noms the Paper!"
  end
end

loop do
  player_choice = ''

  loop do
    puts "Please pick one: Rock(r) Paper(p) Scissors(s):"
    player_choice = gets.chomp.downcase
    break if CHOICES.include?(player_choice)
  end

  computer_choice = CHOICES.sample

  if player_choice == computer_choice
    puts "It's a tie!".center(30, '-')
  elsif (player_choice == "p" && computer_choice == "r") ||
        (player_choice == "r" && computer_choice == "s") ||
        (player_choice == "s" && computer_choice == "p")
    display_winning_message(player_choice)
    puts "Player Wins!".center(30, '-')
  else
    display_winning_message(computer_choice)
    puts "Computer Wins!".center(30, '-')
  end

  puts "Would you like to play again? (y/n)"
  break unless gets.chomp.downcase == "y"
end
