require_relative "Piece.rb"
require 'Singleton'

class NullPiece < Piece

include Singleton
 def initialize()

 end

 def symbol
   "   "
 end



end
