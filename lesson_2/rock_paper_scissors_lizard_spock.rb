#
# Rock Paper Scissors Lizard Spock
#

CHOICES = %w(r p s l sp)

loop do
  player_score = 0
  computer_score = 0

  loop do
    system('clear')

    puts 'Welcome to Rock, Paper, Scissors, Lizard, Spock!'
    puts 'you have begun a battle with machine!'
    puts 'Rules'.center(30, '-')
    puts 'Each win counts as a point'
    puts 'Whoever reaches 5 points wins'
    puts 'Winning Combinations'.center(30, '-')
    puts '-- Paper covers Rock!'
    puts '-- Rock smashes Scissors!'
    puts '-- Scissors cuts Paper!'
    puts '-- Rock crushes lizard!'
    puts '-- Spock smashes Scissors!'
    puts '-- Scissors decapitates Lizard!'
    puts '-- Lizard eats Paper!'
    puts '-- Paper disproves Spock!'
    puts '-- Spock vaporizes Rock!'
    puts '-- Lizard poisons Spock!'
    puts
    puts "PLAYER SCORE: #{player_score}, COMPUTER SCORE: #{computer_score}"

    player_choice = ''

    loop do
      puts
      puts 'Please pick one: Rock(r) Paper(p) Scissors(s) Lizard(l) Spock(sp):'
      player_choice = gets.chomp.downcase
      break if CHOICES.include?(player_choice)
    end

    computer_choice = CHOICES.sample

    puts
    puts "PLAYER CHOICE: #{player_choice}, COMPUTER CHOICE: #{computer_choice}"
    puts

    if player_choice == computer_choice
      puts 'It\'s a tie!'.center(30, '-')
    elsif (player_choice == 'p' && computer_choice == 'r') ||
          (player_choice == 'r' && computer_choice == 's') ||
          (player_choice == 's' && computer_choice == 'p') ||
          (player_choice == 'r' && computer_choice == 'l') ||
          (player_choice == 'sp' && computer_choice == 's') ||
          (player_choice == 's' && computer_choice == 'l') ||
          (player_choice == 'l' && computer_choice == 'p') ||
          (player_choice == 'p' && computer_choice == 'sp') ||
          (player_choice == 'sp' && computer_choice == 'r') ||
          (player_choice == 'l' && computer_choice == 'sp')
      puts 'PLAYER WON!'.center(30, '-')
      player_score += 1
    else
      puts 'COMPUTER WON!'.center(30, '-')
      computer_score += 1
    end

    sleep(1.2)
    break if player_score == 5 || computer_score == 5
  end

  if player_score == 5
    puts "You've Reached 5 Points, You Win!"
  else
    puts "Computer has Reached 5 Points, You Lose! :("
  end

  puts
  puts 'Would you like to play again? (y/n)'
  break unless gets.chomp.downcase.start_with?('y')
end
