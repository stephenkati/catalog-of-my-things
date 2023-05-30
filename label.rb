require_relative 'item'

class Label < Item
def initialize(title, color)
  @id = rand(1...1000)
  @title = title
  @color = color
  @items = []
end
end
