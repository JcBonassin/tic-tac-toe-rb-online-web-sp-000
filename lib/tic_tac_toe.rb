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
