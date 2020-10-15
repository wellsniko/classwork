require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece

    include Slideable

    
    # def initialize color, board, pos
    #     super
    #     @symbol = "#{@color.to_s.split("").first.to_s}" + "R "
    # end
    def symbol
        self.symbol 
    end

    def move_dirs
        diagonal_dirs

        # moves = []
        # x, y = @pos
        # (1..7).each do |i|
        #     moves << [x+i,y+i] << [x-i,y-i] << [x-i,y+i] << [x+i,y-i]
        # end
        # valid_moves = moves.select {|pos| pos.all? {|i| i.between?(0,7)}}  
        # valid_moves
        #return possible piece with whatever piece were moving
        # moves
    end
end