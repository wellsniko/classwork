require_relative "./00_tree_node.rb"

class KnightPathFinder
    attr_accessor :board, :pos, :root_node, :considered_positions
    
    def initialize(pos)
        @start_pos= pos
       
        @considered_positions = [pos]#KnightPathFinder.valid_moves(pos)
       
        @board = Array.new(8) {Array.new(8, 0)}
        build_move_tree
    end
    
    def build_move_tree
        @root_node = PolyTreeNode.new(@start_pos)
        queue = [@root_node]
        while queue.length > 0
            current_parent = queue.shift
            more_positions = new_move_positions(current_parent.value)
            more_positions.each do |pos_of_next_node|
                next_node = PolyTreeNode.new(pos_of_next_node)
                current_parent.add_child(next_node)
                queue << next_node
            end
        end
    end

    def self.valid_moves(pos)
        x, y = pos
        positions = []
        positions << [x+2, y-1] << [x+2, y+1] << [x-2, y-1] << [x-2, y+1] << [x+1, y-2] << [x+1, y+2] << [x-1, y-2] << [x-1, y+2]
        valid_positions = positions.select {|pos| pos.all? {|i| i.between?(0,7)}}  
        valid_positions
    end

    def new_move_positions(pos)
        possible_positions = KnightPathFinder.valid_moves(pos)
        new_positions = possible_positions.select {|pos| !@considered_positions.include?(pos)}
        @considered_positions += new_positions
        return new_positions
    end
end

p kpf = KnightPathFinder.new([0, 0])

