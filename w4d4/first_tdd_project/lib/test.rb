
def my_uniq(array)
    new_array = []
    array.each {|ele| new_array << ele if !new_array.include?(ele)}
    new_array
end

class Array
    def two_sum
        new_arr = []
        (0...self.length - 1).each do |idx1|
            (idx1 + 1...self.length). each do |idx2|
                new_arr << [idx1, idx2] if self[idx1] + self[idx2] == 0
            end
        end
        new_arr
    end
end

def my_transpose(rows)
    (0...rows.length).map do |i|
        rows.map {|row| row[i]}
    end
    # rows.map.with_index {|row, i| row.map {|row| row[i] }}
end
    

def stock_picker(prices)
    pair = []
    max_diff = 0
    (0...prices.length - 1).each do |idx1|
        (idx1+1...prices.length).each do |idx2|
            # p [idx1, idx2]
            # p [prices[idx1], prices[idx2]]
            if prices[idx2] - prices[idx1] > max_diff
                pair = [idx1, idx2]
                max_diff = prices[idx2] - prices[idx1]
            end
        end
    end
    pair
end

p stock_picker([80, 100, 48, 32, 29, 80, 90, 40])

class TowersOfHanoi
    attr_accessor :board
    def initialize
        @board = [[1,2,3], [], []]
        @steps = 0
        # play
    end

    def get_move
        puts "Enter the tower you are taking a disc from and enter tower number to place disk on"
        input = gets.chomp.split(" ").map(&:to_i)
        move(input)
    end

    def move(input)
        @board[input[1]].unshift(@board[input[0]].shift)
        @steps += 1
        p @board
    end

    def play
        p @board
        until won?
            get_move
        end
        p "it took you #{@steps} steps to win"
        @board = [[1,2,3], [], []]
        play
    end

    def won?
        @board[0].empty? && @board.drop(1).any? {|tower| tower == [1,2,3]}
    end
end