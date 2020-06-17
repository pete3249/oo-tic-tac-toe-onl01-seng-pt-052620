require 'pry'

#main game class
class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(string)
    user_input = string.to_i - 1
  end 
  
  def move(index, token = "X")
    @board[index] = token
  end 
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true 
    else 
      false
    end 
  end 
  
  def valid_move?(position)
    if (0..8).include?(position) && @board[position] == " "
      true
    else
      false 
    end 
  end 
  
  def turn_count
    @board.count {|item| item == "X" || item == "O"}
  end 
  
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end 
  end 
  
  def turn
    user_input = gets.chomp
    index = input_to_index(user_input)
      if valid_move?(index) == true
        type = current_player
        move(index, type)
        display_board
      else 
        user_input = gets.chomp
      end 
  end 


        board = game.instance_variable_get(:@board)
        expect(board).to eq(["X", " ", " ", " ", " ", " ", " ", " ", " "])
      end

      it 'asks for input again after a failed validation' do
        game = TicTacToe.new
        allow($stdout).to receive(:puts)

        expect(game).to receive(:gets).and_return("invalid")
        expect(game).to receive(:gets).and_return("1")

        game.turn
      end
    end
  
end 