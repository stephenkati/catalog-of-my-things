require_relative 'item'

class Book < Item
  def initialize(publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
  end
end
