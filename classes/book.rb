require_relative 'item'

class Book < Item
  attr_reader :id
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @id = rand(1...1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    if @cover_state == 'bad' || super
      true
    else
      false
    end
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      publisher: @publisher,
      cover_state: @cover_state
    }
  end
end
