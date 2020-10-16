class Card

    def initialize(value, suit)
        @value = value
        @suit = suit
    end

    # private
    attr_reader :suit, :value

end