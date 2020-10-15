
require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
    attr_reader :color, :board, :pos, :symbol
    def initialize color, board, pos
        super(@color, @board, @pos)
        @color = color
        @pos = pos
        @board = board
        @symbol = "#{@color.to_s.split("").first.to_s}" + "Kn"

    end
    # def moves
    #     #return possible piece with whatever piece were moving
    # end

    def move_diffs
        x, y = @pos
        moves = []
        moves << [x+2, y-1] << [x+2, y+1] << [x-2, y-1] << [x-2, y+1] << [x+1, y-2] << [x+1, y+2] << [x-1, y-2] << [x-1, y+2]
        valid_moves = moves.select {|pos| pos.all? {|i| i.between?(0,7)}}  
        valid_moves
    end
end
