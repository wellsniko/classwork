require 'test'

describe "#my_uniq" do 
    arr = [1, 2, 1, 3, 3]
    it "should not receive .uniq" do
        expect(arr).to_not receive(:uniq)
    end
    it "should return an array with unique elements" do 
        expect(my_uniq(arr)).to eq([1,2,3])
    end
end

describe Array do

    describe "#two_sum" do
        arr = [-1, 0, 2, -2, 1]
        it "finds all pairs of positions where the elements at those positions sum to zero" do
            expect(arr.two_sum).to eq([[0, 4], [2, 3]])
        end
    end

end

describe "#my_transpose" do
    rows = [[0, 1, 2],[3, 4, 5],[6, 7, 8]]
    it "Should not receive .transpose" do
        expect(rows).to_not receive(:transpose)
    end
        
    it "Should convert between the row-oriented and column-oriented representations" do
        expect(my_transpose(rows)).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
end



describe "#stock_picker" do 
    prices = [80, 100, 48, 32, 29, 80, 90, 40]
    it "Should return the most profitable pair of days on which to buy and sell the stock" do 
        expect(stock_picker(prices)).to eq([4,6])
    end
end

describe TowersOfHanoi do
    let(:matt) { TowersOfHanoi.new }

    describe "#move" do
        # @board = [[1,2,3], [], []]
        it "should move the top disk to the top of another" do
            matt.move([0,2])
            expect(matt.board).to eq([[2,3], [], [1]])
        end
    end

    describe "#won?" do
        it "Should let you know if you won the game" do
            if matt.board == [[], [], [1,2,3]] || matt.board == [[], [1,2,3], []]
                expect(matt.won?).to be_truthey
            end
        end
    end
end

# describe Dessert do
#   let(:chef) { double("chef", name: "Niko") }
#   let(:cake) { Dessert.new("cake", 20, chef) }

#   describe "#initialize" do
#     it "sets a type" do
#       expect(cake.type).to eq("cake")
#     end
#     it "sets a quantity" do
#       expect(cake.quantity).to eq(20)
#     end
