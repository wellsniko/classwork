require 'deck'
require 'card'

describe Deck do
    let(:poker) { Deck.new }

    describe '#initialize' do
        it "Should set cards to 52 different cards" do
            expect(poker.cards.uniq.length).to eq(52)
        end

        it "Should have 13 cards of each suit" do
            expect(poker.cards.select{|card|card.suit == :hearts}.length).to eq(13)
            expect(poker.cards.select{|card|card.suit == :spades}.length).to eq(13)
            expect(poker.cards.select{|card|card.suit == :diamonds}.length).to eq(13)
            expect(poker.cards.select{|card|card.suit == :clubs}.length).to eq(13)
        end

        it "Should have 4 suits of each card" do
            expect(poker.cards.map(&:suit).uniq.length).to eq(4)
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

#     it "starts ingredients as an empty array" do
#       expect(cake.ingredients).to be_empty
#     end
#     it "raises an argument error when given a non-integer quantity" do
#       expect { Dessert.new("cake", "hello", "Niko") }.to raise_error(ArgumentError)
#     end
# #   end
# end