#
# Rock Paper Scissors
#

CHOICES = %w(r p s)

puts "Welcome to Rock, Paper, Scissors!"
puts "you have begun a battle with machine!"

def win?(choice1, choice2)
  (choice1 == "p" && choice2 == "r") ||
    (choice1 == "r" && choice2 == "s") ||
    (choice1 == "s" && choice2 == "p")
end

loop do
  player_choice = ''

  loop do
    puts "Please pick one: Rock(r) Paper(p) Scissors(s):"
    player_choice = gets.chomp.downcase
    break if CHOICES.include?(player_choice)
  end

  computer_choice = CHOICES.sample

  if win?(player_choice, computer_choice)
    puts "Player Wins!".center(30, '-')
  elsif win?(computer_choice, player_choice)
    puts "Computer Wins!".center(30, '-')
  else
    puts "It's a tie!".center(30, '-')
  end

  puts "Would you like to play again? (y/n)"
  break unless gets.chomp.downcase == "y"
end
