require './t_t_t.rb'
require './tree.rb'

#make the tree first
cosmo_model = Tree.new(COSMO, 0)



while(cosmo_model.tree.length != 2)
    training_game = TicTacToe.new
    #check game state, end if win or tie
    while training_game.is_win? == false && training_game.is_tie? == false 
        #draw board
        training_game.draw_board
        #dumb-AI selects move at random
        curr_move = rand(9)
        #until a valid move is made, keep generating moves
        while(training_game.place_piece(curr_move) == false)
            curr_move = rand(9)
        end
        #make new node
        this_child = cosmo_model.new_child(curr_move)
        #travel to the new node
        cosmo_model.move_to(this_child.index)
        #make empty new line before drawing new board
        puts "\n"
    end
    training_game.draw_board
    cosmo_model.move_to(0)
    puts '--------------------------------'
end


