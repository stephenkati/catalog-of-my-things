require './item'

class Genre < Item
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    super()
    @id = rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
