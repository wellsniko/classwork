# require_relative 'slideable'
# require_relative 'stepable'
# require_relative 'slideable'
# require_relative "nullpiece"
# require_relative './Board'

class Piece
    attr_reader  :symbol, :color, :board,
    attr_accessor :pos

    def initialize symbol, color, board, pos
        @color = color
        @pos = pos
        @board = board
        @symbol = symbol
    end
    
    # def moves
        #return possible piece with whatever piece were moving
    # end
    # def symbol
    #     "#{@color}" 
    # end
end
