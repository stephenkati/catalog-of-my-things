class Item
  attr_accessor :genre, :author, :source, :label

  def initialize(publish_date, archived)
    @id = rand(1...1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?; end

  def move_to_archive; end
end
