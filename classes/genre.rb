class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_hash
    {
      id: @id,
      name: @name,
      items: @items.map { |item| item.to_hash }
    }
  end
end
