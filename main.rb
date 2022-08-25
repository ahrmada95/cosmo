require './t_t_t.rb'
require './tree.rb'

#make the tree first
cosmo_model = Tree.new(COSMO, 0)



while(cosmo_model.tree.length != 2)
    training_game = TicTacToe.new
    while training_game.is_win? == false && training_game.is_tie? == false 
        training_game.draw_board
        curr_move = rand(9)
        while(training_game.place_piece(curr_move) == false)
            curr_move = rand(9)
        end
        this_child = cosmo_model.new_child(curr_move)
        cosmo_model.move_to(this_child.index)
        puts "\n"
    end
    training_game.draw_board
    cosmo_model.move_to(0)
    puts '--------------------------------'
end


