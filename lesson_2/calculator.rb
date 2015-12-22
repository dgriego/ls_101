#
# Simple Calculator
#

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def valid_expression?(expression)
  regexp = %r{
    \A\d+\.?\d* # any number that contains only one decimal
    \s+         # white space after first number and before operand
    [\+\/\-\*]  # matches available operands
    \s+         # white space after first number and before operand
    \d+\.?\d*$  # any number that contains only one decimal
  }x

  expression =~ regexp
end

def calculate(expression)
  expression = expression.split()

  values = [expression[0].to_f, expression[2].to_f]

  operator = expression[1].to_sym

  solution = values.inject(operator)

  puts "#{messages('solution', LANGUAGE)} #{solution.round(2)}"
end

puts messages('welcome', LANGUAGE)
begin
  loop do
    puts messages('enter_expression', LANGUAGE)
    expression = gets.chomp

    if valid_expression?(expression)
      calculate(expression)
    else
      puts messages('error_message', LANGUAGE)
    end
  end
rescue Interrupt
  puts messages('interrupt_message', LANGUAGE)
end
