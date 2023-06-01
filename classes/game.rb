require './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played
  attr_reader :id

  def initialize(publish_date, multiplayer, last_played)
    super(publish_date)
    @id = rand(1...1000)
    @multiplayer = multiplayer
    @last_played = last_played
  end

  def can_be_archived?
    super && Time.now.year - Date.parse(@publish_date).year > 2
  end
end
