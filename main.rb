def prnt_board(values)
  puts "\n#{values[0]} | #{values[1]} | #{values[2]}\n---------\n#{values[3]} | #{values[4]} | #{values[5]}\n---------\n#{values[6]} | #{values[7]} | #{values[8]}"
end

def row_check(num_list)
  if num_list[0] == num_list[1] && num_list[1] == num_list[2]
    return true
  elsif num_list[3] == num_list[4] && num_list[4] == num_list[5]
    return true
  elsif num_list[6] == num_list[7] && num_list[7] == num_list[8]
    return true
  else
    return false
  end
end

def column_check(num_list)
  if num_list[0] == num_list[3] && num_list[3] == num_list[6]
    return true
  elsif num_list[1] == num_list[4] && num_list[4] == num_list[7]
    return true
  elsif num_list[2] == num_list[5] && num_list[5] == num_list[8]
    return true
  else
    return 
  end
end

def cross_check(num_list)
  if num_list[0] == num_list[4] && num_list[4] == num_list[8]
    return true
  elsif num_list[2] == num_list[4] && num_list[4] == num_list[6]
    return true
  else
    return false
  end
end

def win_check(num_list)
  if row_check(num_list)
    return true
  elsif column_check(num_list)
    return true
  elsif cross_check(num_list)
    return true
  else
    return false
  end
end

position = [1,2,3,4,5,6,7,8,9]
player = 2
player_choice = 0
player1_turn = true
player_won = false

while player_won == false
  prnt_board(position)
  while !position.include? player_choice
    p "Which position would player #{player%2+1} like to go?"
    player_choice = gets.chomp.to_i
  end

  if position[player_choice-1] == 'X' || position[player_choice-1] == 'O'
    p "That spot is already taken. Please choose another location"
  else
    player1_turn ? position[player_choice-1] = 'X' : position[player_choice-1] = 'O'
  end
  if win_check(position)
    prnt_board(position)
    p "Player #{player%2+1} has won!"
    player_won = true
  else
    player1_turn = !player1_turn  # <= changes player turns so choices will alternate between 'X' and 'O'
    player += 1 
  end
end