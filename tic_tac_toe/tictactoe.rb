require 'pry'

WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]


def initialize_board
  b = {}
  (1..9).each { |num| b[num] = ' ' }
  b
end

def draw_board(b)
  system 'clear'
  puts "    |     |   "
  puts "  #{b[1]} |  #{b[2]}  |  #{b[3]}  "
  puts "    |     |   "
  puts "----+-----+----"
  puts "    |     |   "
  puts "  #{b[4]} |  #{b[5]}  |  #{b[6]}  "
  puts "    |     |   "
  puts "----+-----+----"
  puts "    |     |   "
  puts "  #{b[7]} |  #{b[8]}  |  #{b[9]}  "
  puts "    |     |   "
end

def player_pick_square(board)
  spaces_left = board.select { |k, v| v == ' ' }.keys
  begin
    puts 'Pick your space (1 - 9)'
    pick = gets.chomp.to_i
  end until (pick > 0 and pick < 10) and spaces_left.include?(pick)
  board[pick] = 'X'  
end

def two_in_a_row(hsh, mrkr)
  if hsh.values.count(mrkr) == 2
    hsh.select{|k,v| v == ' '}.keys.first
  else
    false
  end
end

def computer_picks_square(board)
  WINNING_LINES.each do |line|
    currrent_positions = {line[0] => board[line[0]], line[1] => board[line[1]], line[2] => board[line[2]]}
    defend_two_in_row = two_in_a_row(currrent_positions, 'X')
    attack_two_in_row = two_in_a_row(currrent_positions, 'O')
    if attack_two_in_row
      board[attack_two_in_row] = 'O'
    elsif defend_two_in_row
      board[defend_two_in_row] = 'O'
    else
      computer_selection = board.select { |k, v| v == ' ' }.keys.sample
      board[computer_selection] = 'O'
      break
    end
  end
end

def check_winner(board)
  WINNING_LINES.each do |line|
    return "Player" if board.values_at(*line).count('X') == 3
    return "Computer" if board.values_at(*line).count('O') == 3
  end
  nil
end

def board_full(board)
  if !board.value?(' ')
    true
  else
    nil
  end
end

loop do 
  board = initialize_board
  draw_board(board)
  
  begin
    player_pick_square(board)
    computer_picks_square(board)
    winner = check_winner(board)
    draw_board(board)
  end until winner || board_full(board)


  if winner
    puts "#{winner} Wins!!"
  else
    puts "It's a Tie!!"
  end

  puts "PLay Again? (y/n)"
  break if gets.chomp != "y"
end



