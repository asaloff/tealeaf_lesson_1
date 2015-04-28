# simple_calculator.rb

def say(string)
  puts "=> #{string}"
end

def ask_for_operation
  say "What would you like to do? 1) Add, 2) Subtract, 3) Multiply, 4) Divide"
end

say "What is the first number?"
num1 = gets.chomp

say "What is the second number?"
num2 = gets.chomp

ask_for_operation
operation = gets.chomp.to_i

until operation > 0 && operation <= 4
    puts "Not a valid operation. Please try again."
    ask_for_operation
    operation = gets.chomp.to_i
end

case operation
when 1
  answer = num1.to_i + num2.to_i
when 2
  answer = num1.to_i - num2.to_i
when 3
 answer = num1.to_i * num2.to_i
else
  answer = num1.to_f / num2.to_f
end

say "The answer is #{answer}"

