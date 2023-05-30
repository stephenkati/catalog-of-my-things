require_relative 'item'

class Label < Item
  attr_reader :id
  attr_accessor :title, :color, :items

  def initialize(title, color)
    super(publish_date)
    @id = rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_hash
    {
      id: @id,
      title: @title,
      color: @color,
      items: @items
    }
  end
end
