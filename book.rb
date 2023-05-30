require_relative 'item'

class Book < Item
  attr_reader :id
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, archived: false)
    super(publish_date, archived: false)
    @id = rand(1...1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    if @cover_state === 'bad' || super
      return archived = true
    else
      return archived = false
    end
  end
end
