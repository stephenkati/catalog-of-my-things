class Item
  attr_accessor :genre, :author, :source, :label

  def initialize(publish_date, archived)
    @id = rand(1...1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?; end

  def move_to_archive; end

  def genre(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.includes?(self)
  end

  def author(author)
    @author = author
    author.add_item(self) unless author.items.includes?(self)
  end

  def source(source)
    @source = source
    source.add_item(self) unless source.items.includes?(self)
  end

  def label(label)
    @label = label
    label.add_item(self) unless label.items.includes?(self)
  end
end
