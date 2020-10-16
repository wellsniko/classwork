require_relative 'card'

class Deck

    VALUES = %i(2 3 4 5 6 7 8 9 10 J Q K A)
    SUITS = %i(spades clubs hearts diamonds)
    

    def initialize
        @cards = create_deck
    end

    # private
    attr_reader :cards
    
    def create_deck
        cards = []
        SUITS.each do |suit|
            VALUES.each {|value| cards << Card.new(value, suit)}
        end
        cards.shuffle!
    end

    def print_deck
        @cards.each {|card| puts [card.value, card.suit]}
    end
    
end







# cards = [[spades,2] [clubs,A], [hearts, J]]

# cards.map {|card| Card.new(card[0],card[1])}


# game = Deck.new
# p game.print_deck