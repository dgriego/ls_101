#
# Loan Calculator
#
require 'colorize'

def calculate_monthly_payment(amount, monthly_rate, months)
  amount *
    (monthly_rate /
    (1 - (1 + monthly_rate)**-months))
end

def calculate_montly_interest_rate(interest_rate)
  apr = interest_rate / 100
  apr / 12
end

loop do
  system('clear')

  puts '-------- ' + "Loan Calculator".colorize(:light_green) + ' --------'

  amount = nil
  loop do
    puts
    puts 'Please enter the amount of the Loan:'.bold
    amount = gets.chomp.to_i

    if amount <= 0
      print '[Invalid Entry] '.colorize(:light_red)
      print "Must enter an amount greater than 0."
    else
      break
    end
  end

  interest_rate = nil
  loop do
    puts
    puts 'Please enter the Annual Interest Rate:'.bold
    puts '(Example: 5 for 5% or 2.5 for 2.5%)'.colorize(:light_black)
    interest_rate = gets.chomp.to_f

    if interest_rate <= 0
      print '[Invalid Entry] '.colorize(:light_red)
      print 'Must enter a rate greater than 0.'
    else
      break
    end
  end

  years = nil
  loop do
    puts
    puts 'Please enter the length of the loan (in years):'.bold
    years = gets.chomp.to_i

    if years <= 0
      print '[Invalid Entry] '.colorize(:light_red)
      print 'Must be one or more years.'
    else
      break
    end
  end

  monthly_rate = calculate_montly_interest_rate(interest_rate)
  months = years * 12

  monthly_payment = calculate_monthly_payment(amount, monthly_rate, months)
  puts
  print 'Monthly Payment: '.bold
  print "$#{format('%#.2f', monthly_payment)}".colorize(:light_yellow)

  puts
  print 'Duration: '.bold
  print "#{months} months".colorize(:light_yellow)

  puts
  puts
  puts "Would you like to perform another calculation?".colorize(:cyan)
  answer = gets.chomp

  break unless answer.downcase().start_with?('y')
end

puts "Thank you for using Loan Calculator!".colorize(:light_green).bold
