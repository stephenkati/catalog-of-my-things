require './classes/item'

class Book < Item
  attr_accessor :publisher, :cover_state, :genre, :author

  def initialize(publisher, publish_date, genre, author, cover_state: 'good')
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @genre = genre
    @author = author
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      publisher: @publisher,
      genre: @genre,
      author: @author,
      cover_state: @cover_state
    }
  end
end
