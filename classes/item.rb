require 'date'

class Item
  attr_reader :id
  attr_accessor :publish_date, :archived, :genres, :authors, :sources, :labels, :label

  def initialize(publish_date, archived: false)
    @id = rand(1...1000)
    @publish_date = publish_date
    @archived = archived
    @genres = []
    @authors = []
    @sources = []
    @labels = []
  end

  def can_be_archived?
    Time.now.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived,
      genres: @genres,
      authors: @authors,
      sources: @sources,
      labels: @labels
    }
  end
end
