require_relative "piece"
class Pawn < Piece
    attr_reader :color, :board, :pos, :symbol
    def initialize color, board, pos
        super(@color, @board, @pos)
        @color = color
        @pos = pos
        @board = board
        @symbol = "#{@color.to_s.split("").first.to_s}" + "P "
        # @at_start_row? = true
    end

    # def at_start_row? 
    #     if @pos[0] != 1 || @pos[0] != 6
    #         @at_start_row = false
    #     end
    #     @at_start_row?
    # end

    def side_attacks
        moves = []
        x, y = @pos
        moves << [x+1,y+1] << [x-1,y-i] << [x+i,y] << [x-i,y]
    
        valid_moves = moves.select {|pos| pos.all? {|i| i.between?(0,7)}}  
        valid_moves
    end

    def move_diffs
        x, y = @pos
        if @color == black
            moves = [[x + 1, y]]
            # if @at_start_row?
            #     moves << [x+2,y]
            # end
        end
        if @color == white
            moves = [[x - 1, y]]
            # if @at_start_row?
            #     moves << [x-2,y]
            # end
        end
        #! Add diagonal attack move
        valid_moves = moves.select {|pos| pos.all? {|i| i.between?(0,7)}}  
        valid_moves
        #return possible piece with whatever piece were moving
    end
end
