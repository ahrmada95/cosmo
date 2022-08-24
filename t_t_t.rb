class TicTacToe

    @@turn_count = 1 #starting at one because its more intuitive

    attr_accessor :game_board

    def initialize 
        @game_board = Array.new(9)
    end

    #checks to see if a cell is empty
    def is_empty? (location_index)
        if(@game_board[location_index] == nil) 
            return true
        else
            return false
        end
    end

    #place piece -> if it fails, returns false
    def place_piece (location_index)
        if is_empty?(location_index) == true
            @@turn_count % 2 == 1 ? @game_board[location_index] = 'x' : @game_board[location_index] = 'o'
            @@turn_count += 1
            return true
        else
            return false
        end
    end

    def win_state_1 
        if @game_board[0] != nil && @game_board[0] == @game_board[3] && game_board[0] == @game_board[6]
            return true
        else
            return false
        end
    end

    def win_state_2 
        if @game_board[0] != nil && @game_board[0] == @game_board[4] && game_board[0] == @game_board[8]
            return true
        else
            return false
        end
    end

    def win_state_3 
        if @game_board[0] != nil && @game_board[0] == @game_board[1] && game_board[0] == @game_board[2]
            return true
        else
            return false
        end
    end

    def win_state_4
        if @game_board[1] != nil && @game_board[1] == @game_board[4] && game_board[1] == @game_board[7]
            return true
        else
            return false
        end
    end

    def win_state_5
        if @game_board[2] != nil && @game_board[2] == @game_board[5] && game_board[2] == @game_board[8]
            return true
        else
            return false
        end
    end

    def win_state_6
        if @game_board[2] != nil && @game_board[2] == @game_board[4] && game_board[2] == @game_board[6]
            return true
        else
            return false
        end
    end
    
    def win_state_7
        if @game_board[3] != nil && @game_board[3] == @game_board[4] && game_board[3] == @game_board[5]
            return true
        else
            return false
        end
    end

    def win_state_8
        if @game_board[6] != nil && @game_board[6] == @game_board[7] && game_board[1] == @game_board[8]
            return true
        else
            return false
        end
    end

    #returns true if win state is reached
    def is_win? 
        if win_state_1 || win_state_2 || win_state_3 || win_state_4 || win_state_5 || win_state_6 || win_state_7 || win_state_8
            return true
        else
            return false
        end
    end

    def is_tie? 
        if (is_win? == false && !is_empty?(0) && !is_empty?(1) && !is_empty?(2) && !is_empty?(3) && !is_empty?(4) && !is_empty?(5) && !is_empty?(6) && !is_empty?(7) && !is_empty?(8))
            return true
        else 
            return false
        end
    end 

    #ACCESSORY FUNCTIONS
    def draw_board 
        puts ("[#{@game_board[6] == nil ? "6": @game_board[6]}][#{@game_board[7] == nil ? "7": @game_board[7]}][#{@game_board[8] == nil ? "8": @game_board[8]}]")
        puts ("[#{@game_board[3] == nil ? "3": @game_board[3]}][#{@game_board[4] == nil ? "4": @game_board[4]}][#{@game_board[5] == nil ? "5": @game_board[5]}]")
        puts ("[#{@game_board[0] == nil ? "0": @game_board[0]}][#{@game_board[1] == nil ? "1": @game_board[1]}][#{@game_board[2] == nil ? "2": @game_board[2]}]")
    end

    #returns turn count 
    def turn_count 
        return @@turn_count
    end
end

# this_game = TicTacToe.new

# while(this_game.is_win? == false && this_game.is_tie? == false)
#     this_game.draw_board
#     puts "Turn Count: #{this_game.turn_count}"
#     puts "Where do you want to place (0-8)?: "
#     position = gets.to_i

#     while (this_game.place_piece(position) == false)
#         puts "Invalid move, please place it in a valid location (0-8):"
#         position = gets.to_i
#     end
# end

# this_game.draw_board

# if (this_game.is_win? == true) 
#     puts "#{this_game.turn_count % 2 ? "Player 1 Wins!" : "Player 2 Wins!"}"
# elsif (this_game.is_tie? == true) 
#     "Tie Game!"
# else 
#     return false
# end 


