class Hand
    attr_reader :hand, :sorted_hand

    CARD_ORDER = %i(2 3 4 5 6 7 8 9 10 J Q K A)

    def initialize(hand)
        @hand = hand
        @sorted_hand = sort_hand
    end

    def royal_flush
        array = [:10, :J, :Q, :K, :A]
    end


    # private
    def sort_hand
        return hand.sort_by { |a| CARD_ORDER.index(a.value) }
    end
end





high card 7
high card 8
high card 9
high card 10
high card J
high card Q
high card K
high card A

pair 2
pair 3
pair 4
pair 5
pair 6
pair 7
pair 8
pair 9
pair 10
pair J
pair Q
pair K
pair A

2 pair, 3 highest
2 pair, 4 highest
2 pair, 5 highest
2 pair, 6 highest
2 pair, 7 highest
2 pair, 8 highest
2 pair, 9 highest
2 pair, 10 highest
2 pair, J highest
2 pair, Q highest
2 pair, K highest
2 pair, A highest

trips 2
trips 3
trips 4
trips 5
trips 6
trips 7
trips 8
trips 9
trips 10
trips J
trips Q
trips K
trips A

straight 5 high - ace included but not highest
straight 6 high
straight 7 high
straight 8 high
straight 9 high
straight 10 high
straight J high
straight Q high
straight K high
straight A high


flush 7 high
flush 8 high
flush 9 high
flush 10 high
flush J high
flush Q high
flush K high
flush A high

fullhouse, trips 2
fullhouse, trips 3
fullhouse, trips 4
fullhouse, trips 5
fullhouse, trips 6
fullhouse, trips 7
fullhouse, trips 8
fullhouse, trips 9
fullhouse, trips 10
fullhouse, trips J
fullhouse, trips Q
fullhouse, trips K
fullhouse, trips A

straight flush 5 high - ace included but not highest
straight flush 6 high
straight flush 7 high
straight flush 8 high
straight flush 9 high
straight flush 10 high
straight flush J high
straight flush Q high
straight flush K high
straight flush A high


