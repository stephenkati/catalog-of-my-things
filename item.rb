class Item
  attr_reader :id
  attr_accessor :publish_date, :archived, :genres, :authors, :sources, :labels

  def initialize(publish_date, archived)
    @id = rand(1...1000)
    @publish_date = publish_date
    @archived = archived
    @genres = []
    @authors = []
    @sources = []
    @labels = []
  end

  def can_be_archived?
    # Determining if the item can be archived
  end

  def move_to_archive
    # Moving the item to the archive
  end

  def add_genre(genre)
    genres << genre
    genre.add_item(self)
  end

  def add_author(author)
    authors << author
    author.add_item(self)
  end

  def add_source(source)
    sources << source
    source.add_item(self)
  end

  def add_label(label)
    labels << label
    label.add_item(self)
  end
end
