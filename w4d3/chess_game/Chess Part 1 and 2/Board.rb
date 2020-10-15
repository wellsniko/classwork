 require_relative 'pieces/pieces.rb'
 

 
 class Board
    attr_reader :rows, :sentinel

    def initialize
        @sentinel = NullPiece.instance
        @rows = Array.new(8){Array.new(8, @sentinel)}
        load_board
    end

    def valid_pos?(pos)
        x, y = pos
        (x.between?(0,7) && y.between?(0,7))
        
    end

    def[](pos)
        row, col = pos 
        @rows[row][col]
    end

    def[]=(pos,value)
        row, col = pos 
        @rows[row][col] = value
    end

    def move_piece(color, start_pos, end_pos)
        x,y = start_pos
        if valid_pos?(start_pos) && !start_pos != sentinel && valid_pos?(end_pos) 
        # if valid_pos?(start_pos) && @rows[x][y].move_diffs.include?(end_pos) && color == @rows[x][y].color
            
            self[end_pos] = self[start_pos]
            self[start_pos] = @sentinel
            # start_pos, end_pos = end_pos, nil
        end
    
    end

    def load_board
        @rows[0] = [
            #back row
            Rook.new(:Rb, :black, self, [0, 0]), 
            Knight.new(:Nb, :black, self, [0, 1]), 
            Bishop.new(:Bb, :black, self, [0, 2]), 
            Queen.new(:Qb,:black, self, [0, 3]), 
            King.new(:Kb,:black, self, [0, 4]), 
            Bishop.new(:Bb,:black, self, [0, 5]),
            Knight.new(:Nb,:black, self, [0, 6]),
            Rook.new(:Rb,:black, self, [0, 7])] 

        @rows[1].each_with_index do |row, i|
            @rows[1][i] = Pawn.new(:Pb,:black,self,[1, i])
        end
        #♜♞♝♛♚♝♞♜♟ ♖♘♗♕♔♗♘♖♙
        @rows[6].each_with_index do |row, i|
            @rows[6][i] = Pawn.new(:Pw, :white,self,[6, i])
        end

        @rows[7] = [
            #front row
            Rook.new(:Rw,:white, self, [7, 0]), 
            Knight.new(:Nw,:white, self, [7, 1]), 
            Bishop.new(:Bw,:white, self, [7, 2]), 
            Queen.new(:Qw,:white, self, [7, 3]), 
            King.new(:Kw,:white, self, [7, 4]), 
            Bishop.new(:Bw,:white, self, [7, 5]),
            Knight.new(:Nw:white, self, [7, 6]),
            Rook.new(:Rw,:white, self, [7, 7])] 
    end

    def print_board
        @rows.each do |col|
            new_arr = col.map do |space| 
                # if space != sentinel
                    space.symbol
                # else
                #     "___"
                # end
            end
            puts new_arr.join(" ")
            puts
        end
    end
 end


 game = Board.new
 game.rows
 game.print_board

 game.move_piece(:black, [1,0], [2,0])

 game.print_board