# Tic Tac Toe

def render_board(choice)
  puts " #{choice[1]} | #{choice[2]} | #{choice[3]} "
  puts "-----------"
  puts " #{choice[4]} | #{choice[5]} | #{choice[6]} "
  puts "-----------"
  puts " #{choice[7]} | #{choice[8]} | #{choice[9]} "
end

def print_victory_message(choice)
  if choice == 'X'
    puts "=> PLAYER WINS!"
  elsif choice == 'O'
    puts "=> COMPUTER WINS!"
  else
    puts "=> IT'S A TIE!"
  end
end

def choice_taken?(choice, choices)
  choices[choice.to_i] != " "
end

def check_for_win(choices) # => returns 'X', 'O' or nil
  winner = nil
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # horizontals
                  [[1, 4, 7], [2, 5, 8], [3, 6, 7]] + # verticals
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  winning_lines.each do |line|
    if choices[line[0]] == choices[line[1]] &&
       choices[line[1]] == choices[line[2]] && choices[line[0]] != ' '
      winner = choices[line[0]]
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
    break unless choice_taken?(player_choice, choices)
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

loop do
  # setup choices Hash
  choices = {}
  (1..9).each { |i| choices[i] = " " }

  loop do
    system('clear')

    puts "Welcome to Tic Tac Toe!"
    puts "First to win 5 games wins"
    puts "Pick a Sqaure (1 - 9):"
    puts

    render_board(choices)

    # Player Turn
    player_makes_choice(choices)
    winner = check_for_win(choices)

    # Computer Turn
    unless winner
      computer_makes_choice(choices)
      render_board(choices)
      winner = check_for_win(choices)
    end

    print_victory_message(winner) if winner
    break if winner || empty_positions(choices).empty?
  end

  puts "=> Would you like to play again?(y/n)"
  break if gets.chomp.downcase.start_with?('n')
end
