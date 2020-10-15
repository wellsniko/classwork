require_relative 'piece'
require 'singleton'

class NullPiece < Piece

    attr_reader :symbol
    include Singleton

    def initialize
        @symbol = "___"
    end

    def moves 
        []
    end
end