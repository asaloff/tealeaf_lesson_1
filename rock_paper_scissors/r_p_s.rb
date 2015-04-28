# Rock Paper Scissors!!

CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
puts "Welcome to Rock Paper Scissors!!"

def display_win_message(winning_choice, winner)
  case winning_choice
  when 'p'
    puts 'Paper covers Rock!!'
  when 'r'
    puts 'Rock smashes Scissors!!'
  when 's'
    puts 'Scissors cuts Paper!!'
  end
  if winner == "computer"
    puts "Computer wins. Better luck next time!"
  elsif winner == "player"
    puts "YOU WIN!!"
  end
end

loop do
  begin
  puts "Pick one: (p, r, s)"
  user_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(user_choice)

  computer_choice = CHOICES.keys.sample

  if (user_choice == 'p' && computer_choice == 'r') || (user_choice == 'r' && computer_choice == 's') || (user_choice == 's' && computer_choice == 'p')
    display_win_message(user_choice, 'player')
  else
    display_win_message(computer_choice, 'computer')
  end 

  puts "Play again? y/n"
  
  break if gets.chomp.downcase != 'y'  
end