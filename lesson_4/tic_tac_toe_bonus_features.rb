# Tic Tac Toe

def board_configuration
  choices = {}

  (1..9).each { |i| choices[i] = " " }

  choices
end

def render_board(choice)
  puts " #{choice[1]} | #{choice[2]} | #{choice[3]}"
  puts "-----------"
  puts " #{choice[4]} | #{choice[5]} | #{choice[6]}"
  puts "-----------"
  puts " #{choice[7]} | #{choice[8]} | #{choice[9]}"
end

def print_round_victory_message(choice)
  if choice == 'X'
    puts "=> PLAYER WINS THE ROUND!"
  elsif choice == 'O'
    puts "=> COMPUTER WINS THE ROUND!"
  else
    puts "=> THIS ROUND IS A TIE!"
  end
end

def choice_taken?(choice, choices)
  choices[choice.to_i] != " "
end

def check_for_round_win(c) # => returns 'X' or 'O'
  winner = nil
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # horizontals
                  [[1, 4, 7], [2, 5, 8], [3, 6, 7]] + # verticals
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  winning_lines.each do |line|
    if c[line[0]] == c[line[1]] && c[line[1]] == c[line[2]] && c[line[0]] != ' '
      winner = c[line[0]]
    end
  end

  winner
end

def empty_positions(choices)
  choices.select { |_, v| v == ' ' }.keys
end

def player_makes_choice(choices)
  player_choice = nil

  loop do
    player_choice = gets.chomp
    break if !choice_taken?(player_choice, choices)
  end

  choices[player_choice.to_i] = "X"
end

def computer_makes_choice(choices)
  computer_choice = empty_positions(choices).sample

  choices[computer_choice] = "O"
end

def joinor(choices_array, delimiter, word='or ') # => 1, 2, 3 or 4
  choices_array[choices_array.last - 1] = choices_array.last.to_s.prepend(word)

  "#{choices_array.join(delimiter)}"
end

player_score = 0
computer_score = 0

loop do
  choices = board_configuration

  loop do
    system('clear')

    puts "Welcome to Tic Tac Toe!"
    puts "First to win 5 games wins"
    puts "Choose a position to place a piece #{joinor(choices.keys, ', ')}:"
    puts

    render_board(choices)
    puts
    puts "Player Score: #{player_score} | " \
         "Computer Score: #{computer_score}"

    # Player Turn
    player_makes_choice(choices)
    round_winner = check_for_round_win(choices)

    # Computer Turn
    if !round_winner
      computer_makes_choice(choices)
      render_board(choices)
      round_winner = check_for_round_win(choices)
    end

    if round_winner
      print_round_victory_message(round_winner)
      sleep(1)
    end

    # Add score
    player_score += 1 if round_winner == 'X'
    computer_score += 1 if round_winner == 'O'

    break if round_winner || empty_positions(choices).empty?
  end

  if player_score == 5 || computer_score == 5
    puts "You Have Won 5 Games! You Win!" if player_score == 5
    puts "Computer Has Won 5 Games! You Lose!" if computer_score == 5
    puts "=> Would you like to play again?(y/n)"
    play_again = gets.chomp.downcase.start_with?('n')

    player_score = 0
    computer_score = 0
  end

  break if play_again
end
