require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify
  attr_reader :id

  class initialize(on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify == true
  end
end
