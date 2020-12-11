WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  new_user_input = user_input.to_i
  new_user_input -= 1
  return new_user_input
end

def move(board, index, character = "X")
  board[index] = character
  return board
end

def position_taken?(board,index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board,index)
  if index.between?(0,8) && !position_taken?(board,index)
    return true
  end
end

def turn_count(board)
  turn_count = 0
  board.each do |player|
    if player == "X" || player == "O"
      turn_count += 1
    end
  end
  return turn_count
end

def current_player(board)
  turn_count = turn_count(board)
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn (board)
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  if valid_move?(board, index) == true
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
   WIN_COMBINATIONS.each do |t|
     win_index_1 = t[0]
     win_index_2 = t[1]
     win_index_3 = t[2]
     game_status_1 = board[win_index_1]
     game_status_2 = board[win_index_2]
     game_status_3 = board[win_index_3]
     if game_status_1 == "X" && game_status_2 == "X" && game_status_3 == "X"
       return t
     elsif game_status_1 == "O" && game_status_2 == "O" && game_status_3 == "O"
       return t
     else
       false
     end
   end
   false
 end

 def full?(board)
if (board.select{|i| i == "X" || i == "O"}).length < 9
  return false
else
  return true
end
end


def draw?(board)
if full?(board) == true && won?(board) == false
  return true
else
  return false
end
end

def over?(board)
if full?(board) == true
  return true
elsif won?(board)
  return true
elsif draw?(board)
  return true
else
  return false
end
end

def winner(board)
winner = won?(board)
if winner != false
  if board[winner[0]] == "O"
    #puts "YAY you won!"
    return "O"
  elsif board[winner[0]] == "X"
    #puts "YAY you won!"
    return "X"
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
end

if won?(board)
    puts "hey you won #{winner}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
