# Tic Tac Toe Bonus Features
COMPUTER_MARKER = 'O'
PLAYER_MARKER = 'X'
FIRST_PLAYER = 'choose'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # horizontals
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # verticals
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def render_board(choice)
  puts " #{choice[1]} | #{choice[2]} | #{choice[3]}"
  puts "-----------"
  puts " #{choice[4]} | #{choice[5]} | #{choice[6]}"
  puts "-----------"
  puts " #{choice[7]} | #{choice[8]} | #{choice[9]}"
end

def print_round_victory_message(choice)
  if choice == PLAYER_MARKER
    puts "=> PLAYER WINS THE ROUND!"
  elsif choice == COMPUTER_MARKER
    puts "=> COMPUTER WINS THE ROUND!"
  else
    puts '=> IT\'S A TIE!'
  end
end

def choice_taken?(choice, choices)
  choices[choice.to_i] != ' '
end

def check_for_round_win(choices) # => returns 'X', 'O' or nil
  winner = nil

  WINNING_LINES.each do |line|
    if choices[line[0]] == choices[line[1]] &&
       choices[line[1]] == choices[line[2]] && choices[line[0]] != ' '
      winner = choices[line[0]]
    end
  end

  winner
end

def find_at_risk_square(line, choices, marker)
  # line = [1, 2, 3]
  position = nil

  if line.count { |index| choices[index] == marker } == 2
    position = line.find { |index| choices[index] == ' ' }
  end

  position
end

def empty_positions(choices)
  choices.select { |_, index| index == ' ' }.keys
end

def player_makes_choice(choices)
  player_choice = nil

  loop do
    player_choice = gets.chomp
    break unless choice_taken?(player_choice, choices)
  end

  choices[player_choice.to_i] = PLAYER_MARKER
end

def computer_makes_choice(choices)
  index = nil

  # Defense
  WINNING_LINES.each do |line|
    index = find_at_risk_square(line, choices, COMPUTER_MARKER)
    break if index
  end

  # Offense
  unless index
    WINNING_LINES.each do |line|
      index = find_at_risk_square(line, choices, PLAYER_MARKER)
      break if index
    end
  end

  unless index
    # choose middle square if it is empty before choosing random position
    index = choices[5] == ' ' ? 5 : empty_positions(choices).sample
  end

  choices[index] = COMPUTER_MARKER
end

def joinor(choices_array, delimiter, word='or ') # => 1, 2, 3 or 4
  choices_array[choices_array.last - 1] = choices_array.last.to_s.prepend(word)

  "#{choices_array.join(delimiter)}"
end

def place_piece!(choices, current_player)
  if current_player == 'player'
    player_makes_choice(choices)
  else
    computer_makes_choice(choices)
  end
end

def alternate_player(current_player)
  current_player == 'computer' ? 'player' : 'computer'
end

def determine_who_goes_first
  if FIRST_PLAYER == 'choose'
    puts 'Would you like to go first this Round?(y/n)'
    gets.chomp.start_with?('n') ? 'computer' : 'player'
  else
    FIRST_PLAYER
  end
end

player_score = 0
computer_score = 0

loop do
  choices = {}
  (1..9).each { |i| choices[i] = " " }

  system('clear')
  puts 'Welcome to Tic Tac Toe!'
  puts 'First to win 5 games wins'

  current_player = determine_who_goes_first

  loop do
    system('clear')

    puts "Choose a position to place a piece #{joinor(choices.keys, ', ')}:"
    puts

    render_board(choices)
    puts
    puts "Player Score: #{player_score} | " \
         "Computer Score: #{computer_score}"

    place_piece!(choices, current_player)
    current_player = alternate_player(current_player)
    round_winner = check_for_round_win(choices)

    if round_winner || empty_positions(choices).empty?
      system('clear')
      puts
      render_board(choices)
      puts
      print_round_victory_message(round_winner)
      sleep(1)
    end

    # Add score
    player_score += 1 if round_winner == PLAYER_MARKER
    computer_score += 1 if round_winner == COMPUTER_MARKER

    break if round_winner || empty_positions(choices).empty?
  end

  if player_score == 5 || computer_score == 5
    puts 'You Have Won 5 Games! You Win!' if player_score == 5
    puts 'Computer Has Won 5 Games! You Lose!' if computer_score == 5
    puts '=> Would you like to play again?(y/n)'
    play_again = gets.chomp.downcase.start_with?('n')

    player_score = 0
    computer_score = 0
  end

  break if play_again
end
