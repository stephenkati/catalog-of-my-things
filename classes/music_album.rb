require './classes/item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date, :genre, :author
  attr_reader :id

  def initialize(publish_date, on_spotify, genre, author)
    super(publish_date)
    @id = rand(1...1000)
    @on_spotify = on_spotify
    @genre = genre
    @author = author
  end

  def can_be_archived?
    super && on_spotify == true
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      on_spotify: @on_spotify,
      genre: @genre,
      author: @author
    }
  end
end
