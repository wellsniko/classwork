require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
    attr_reader :color, :board, :pos, :symbol
    def initialize color, board, pos
        super(@color, @board, @pos)
        @color = color
        @pos = pos
        @board = board
        @symbol = "#{@color.to_s.split("").first.to_s}" + "Q "
    end
    def move_diffs
        moves = []
        x, y = @pos
        (1..7).each do |i|
            moves << [x,y+i] << [x,y-i] << [x+i,y] << [x-i,y] << [x+i,y+i] << [x-i,y-i] << [x-i,y+i] << [x+i,y-i]
        end
        #class constant
        #queen 
        valid_moves = moves.select {|pos| pos.all? {|i| i.between?(0,7)}}  
        valid_moves
        #return possible piece with whatever piece were moving
    end   
        #return possible piece with whatever piece were moving
end