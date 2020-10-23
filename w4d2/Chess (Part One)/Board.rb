 require_relative 'Piece.rb'
 
 class Board
    attr_reader :rows, :sentinel

    def initialize
        @rows = Array.new(8){Array.new(8, "_")}
        load_board
    end

    def load_board
        @rows[0] = [
            #back row
            Rook.new(:black, self, [0, 0]), 
            Knight.new(:black, self, [0, 1]), 
            Bishop.new(:black, self, [0, 2]), 
            Queen.new(:black, self, [0, 3]), 
            King.new(:black, self, [0, 4]), 
            Bishop.new(:black, self, [0, 5]),
            Knight.new(:black, self, [0, 6]),
            Rook.new(:black, self, [0, 7])] 

        @rows[1].each_with_index do |row, i|
            @rows[1][i] = Pawn.new(:black,self,[1, i])
        end
        
        @rows[6].each_with_index do |row, i|
            @rows[6][i] = Pawn.new(:white,self,[6, i])
        end

        @rows[7] = [
            #front row
            Rook.new(:white, self, [7, 0]), 
            Knight.new(:white, self, [7, 1]), 
            Bishop.new(:white, self, [7, 2]), 
            Queen.new(:white, self, [7, 3]), 
            King.new(:white, self, [7, 4]), 
            Bishop.new(:white, self, [7, 5]),
            Knight.new(:white, self, [7, 6]),
            Rook.new(:white, self, [7, 7])] 
    end

    def print_board
        @rows.each do |col|
            new_arr = col.map do |space| 
                if space != "_"
                    space.symbol
                else
                    "___"
                end
            end
            puts new_arr.join(" ")
            puts
        end
    end
 end


 game = Board.new
 game.rows
 game.print_board