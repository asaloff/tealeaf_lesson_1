# Rock Paper Scissors!!

CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
puts "Welcome to Rock Paper Scissors!!"

def display_win_message(winning_choice)
  case winning_choice
  when 'p'
    puts 'Paper covers Rock!!'
  when 'r'
    puts 'Rock smashes Scissors!!'
  when 's'
    puts 'Scissors cuts Paper!!'
  end
end

loop do
  begin
  puts "Pick one: (p, r, s)"
  user_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(user_choice)

  computer_choice = CHOICES.keys.sample

  if (user_choice == 'p' && computer_choice == 'r') || (user_choice == 'r' && computer_choice == 's') || (user_choice == 's' && computer_choice == 'p')
    display_win_message(user_choice)
    puts "YOU WIN!!"
  else
    display_win_message(computer_choice)
    puts "Better luck next time"
  end 

  puts "Play again? y/n"
  
  break if gets.chomp.downcase != 'y'  
end