require_relative 'piece'
require_relative 'stepable'


class King < Piece
    attr_reader :color, :board, :pos, :symbol
    def initialize color, board, pos
        super(@color, @board, @pos)
        @color = color
        @pos = pos
        @board = board
        @symbol = "#{@color.to_s.split("").first.to_s}" + "$K"
    end
    def move_diffs
        moves = []
        x, y = @pos
        moves << [x+1,y+1] << [x-1,y-1]<< [x+1, y-1] << [x-1,y+1] << [x,y+1] << [x,y-1] << [x+1,y] << [x-1,y]
        valid_moves = moves.select {|pos| pos.all? {|i| i.between?(0,7)}}  
        valid_moves
        #return possible piece with whatever piece were moving
    end
end