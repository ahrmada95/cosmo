#global constants to represent MI object or player (opponent)
COSMO = "COSMO";
PLAYER = "PLAYER";

class Tree

    attr_accessor :tree, :curr_index, :prev_index

    class Node
        #index = index of self within the tree
        #children = array of children indexes within the tree
        #player_type = either COSMO or PLAYER
        #position = the move chosen at the time
        #win_weight = the "winningness" of the branch, used for decision making
        attr_accessor :index, :parent, :children, :player_type, :turn_count, :position, :win_weight


        #initialize node, default value is that of a root, with COSMO as the player, first turn of the game, no position, win_weight of 0
        def initialize (index=0, parent=0, player_type=COSMO, turn_count=1, win_weight=0, position)
            @index = index
            @parent = parent
            @children = [] #empty array of children indexes
            @player_type = player_type
            @turn_count = turn_count
            @position = position
            @win_weight = win_weight
        end

        #function to check if the current root is node or not
        def is_root?
            if self.parent == 0
                return true
            else
                return false
            end
        end

        #function to return if it is a leaf or not
        def is_leaf? 
            if self.children.length == 0
                return true
            else
                return false
            end
        end

    end

    def initialize (player_type, position)
        @tree = []
        @curr_index = 0
        @prev_index = [0]
        root = Node.new(0,player_type,1,0,position)
        @tree.push(root)
    end

    #add a new child to the current index -> takes in the move made as the parameter, also moves to the new child
    def new_child (position)
        new_node = Node.new(tree.length, @tree[curr_index], (@tree[curr_index].player_type == COSMO ? PLAYER : COSMO), @tree[curr_index].turn_count+1, 0, position)
        @tree.push(new_node)
        @tree[curr_index].children << new_node.index
        return new_node
    end

    #traverse to certain 
    def move_to (index) 
        #add to previous index
        @prev_index.push(@curr_index)
        @curr_index = index
        return true
    end

    def go_prev #returns previous index we were at, deletes latest entry
        return @prev_index.pop
    end

    #returns index of the next most successful move
    #moves to the new node and returns the position
    def next_move
        #heaviest index set to current index
        heaviest_win = @tree[curr_index].index

        @tree[curr_index].children.each do |child| 
            if @tree[heaviest_win].win_weight < child.win_weight 
                heaviest_win = child.index
            end
        end

        #move there
        @curr_index = heaviest_win
        return heaviest_win 
    end
        
    #recursive function to update win weights on successful win
    def update_win 
        #first update current node with +1, dont if its a root
        if @tree.curr_index.is_root? == false 
            @tree.curr_index.win_weight + 1
            @tree[@tree.curr_index.parent].update_win
        end
    end
end 



# this_tree = Tree.new(COSMO,1)

# puts "We are currently at [#{this_tree.curr_index}]"

# this_tree.new_child(2)

# puts "The size of the tree #{this_tree.tree.length}"

# puts this_tree.tree[0].children

# puts this_tree.tree[1].index
# puts this_tree.tree[1].children
# puts this_tree.tree[1].player_type
# puts this_tree.tree[1].turn_count
# puts this_tree.tree[1].win_weight
# puts this_tree.tree[1].position

# this_tree.move_to(1)
# this_tree.new_child(3)

# puts this_tree.tree[1].children

# this_tree.move_to(2)

# puts this_tree.prev_index

# this_tree.go_prev

# puts this_tree.prev_index


