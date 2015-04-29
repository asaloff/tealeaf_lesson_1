# Rock Paper Scissors!!

CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
puts "Welcome to Rock Paper Scissors!!"

draws = 0
player_wins = 0
computer_wins = 0

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

puts "What is your name?"
player_name = gets.chomp.capitalize

loop do
  begin
    puts "Pick one: (p, r, s)"
    user_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(user_choice)

  computer_choice = CHOICES.keys.sample

  if (user_choice == 'p' && computer_choice == 'r') || (user_choice == 'r' && computer_choice == 's') || (user_choice == 's' && computer_choice == 'p')
    display_win_message(user_choice, 'player')
    player_wins += 1
  elsif user_choice == computer_choice
    puts "It's a Draw."
    draws += 1
  else
    display_win_message(computer_choice, 'computer')
    computer_wins += 1
  end 

  puts "The score is now: #{player_name} (#{player_wins}) || Computer (#{computer_wins}) || Ties (#{draws})"
  puts "Play again? y/n"
  
  break if gets.chomp.downcase != 'y'  
end