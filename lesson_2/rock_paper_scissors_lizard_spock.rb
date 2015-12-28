#
# Rock Paper Scissors Lizard Spock
#
require 'yaml'

MESSAGES = YAML.load_file('rps_messages.yml')
CHOICES = %w(r p s l sp)

def prompt(message)
  puts
  puts "#{message}"
end

loop do
  player_score = 0
  computer_score = 0

  loop do
    system('clear')

    puts MESSAGES['welcome']
    puts MESSAGES['rules']
    puts MESSAGES['winning_combinations']

    prompt("PLAYER SCORE: #{player_score}, COMPUTER SCORE: #{computer_score}")

    player_choice = ''

    loop do
      puts MESSAGES['pick_one']
      player_choice = gets.chomp.downcase
      break if CHOICES.include?(player_choice)
    end

    computer_choice = CHOICES.sample

    prompt("PLAYER CHOICE: #{player_choice}, COMPUTER CHOICE: #{computer_choice}")

    if player_choice == computer_choice
      prompt('It\'s a tie!'.center(30, '-'))
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
      prompt('PLAYER WON!'.center(30, '-'))
      player_score += 1
    else
      prompt('COMPUTER WON!'.center(30, '-'))
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

  prompt('Would you like to play again? (y/n)')
  break unless gets.chomp.downcase.start_with?('y')
end
