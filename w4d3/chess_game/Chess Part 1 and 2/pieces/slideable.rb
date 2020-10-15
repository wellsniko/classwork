module Slideable
    DIAGONAL_DIRS = [[1,1],[-1,-1], [1,-1], [-1,1]]
    HORIZONTAL_DIRS = [[0,1],[1,0],[0,-1],[-1,0]]

    attr_reader :DIAGONAL_DIRS, :HORIZONTAL_DIRS

    def moves 
        moves = []
        move_dirs.each do |sub_arr|
            dx,dy = sub
            moves += grow_unblocked_moves_in_dirs(dx,dy)
        end
        moves
    end

    def grow_unblocked_moves_in_dirs(dx, dy)
        x,y = pos
        moves = []
        loop do
            possible_pos = [x+dx, y+dy]
            break if !board.valid_pos?(possible_pos) 
            
            if !board[possible_position].empty?
                break if board[possible_positon].color == color
                #! check if the position is empty or any ememy piece is there , then put possible_pos into moves
                #! if friendly piece is there, next again
            end
            moves << possible_pos
        end
        moves 
    end

    def horizontal_dirs
    
        HORIZONTAL_DIRS
    end
    
    def diagonal_dirs
        
        DIAGONAL_DIRS
    end



end

