class Piece
    attr_reader :color, :board, :pos
    def initialize color, board, pos
        @color = color
        @pos = pos
        @board = board
    end
    
    def moves
        #return possible piece with whatever piece were moving
    end
    # def symbol
    #     "#{@color}" 
    # end
end


class Pawn < Piece
    attr_reader :color, :board, :pos, :symbol
    def initialize color, board, pos
        super(@color, @board, @pos)
        @color = color
        @pos = pos
        @board = board
        @symbol = "#{@color.to_s.split("").first.to_s}" + "P "
    end
    def moves
        #return possible piece with whatever piece were moving
    end
end


class Rook < Piece
    attr_reader :color, :board, :pos, :symbol
    def initialize color, board, pos
        super(@color, @board, @pos)
        @color = color
        @pos = pos
        @board = board
        @symbol = "#{@color.to_s.split("").first.to_s}" + "R "
    end
    def moves
        #return possible piece with whatever piece were moving
    end
end


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

    def moves
        x, y = @pos
        positions = []
        positions << [x+2, y-1] << [x+2, y+1] << [x-2, y-1] << [x-2, y+1] << [x+1, y-2] << [x+1, y+2] << [x-1, y-2] << [x-1, y+2]
        valid_moves = positions.select {|pos| pos.all? {|i| i.between?(0,7)}}  
        valid_moves
    end
end


class Bishop < Piece
    attr_reader :color, :board, :pos, :symbol
    def initialize color, board, pos
        super(@color, @board, @pos)
        @color = color
        @pos = pos
        @board = board
        @symbol = "#{@color.to_s.split("").first.to_s}" + "B "
    end
    def moves
        #return possible piece with whatever piece were moving
    end
end


class Queen < Piece
    attr_reader :color, :board, :pos, :symbol
    def initialize color, board, pos
        super(@color, @board, @pos)
        @color = color
        @pos = pos
        @board = board
        @symbol = "#{@color.to_s.split("").first.to_s}" + "Q "
    end
    def moves
        #return possible piece with whatever piece were moving
    end
end


class King < Piece
    attr_reader :color, :board, :pos, :symbol
    def initialize color, board, pos
        super(@color, @board, @pos)
        @color = color
        @pos = pos
        @board = board
        @symbol = "#{@color.to_s.split("").first.to_s}" + "$K"
    end
    def moves
        #return possible piece with whatever piece were moving
    end
end