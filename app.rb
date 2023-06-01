require './classes/item'
require './classes/book'
require './classes/label'
require './classes/genre'
require './classes/music_album'
require './classes/game'
require './classes/author'
require './data/preserve_data'

class App
  attr_accessor :books, :labels, :items, :music_albums, :genres
  attr_accessor :games, :authors

  def initialize
    @items = []
    @labels = []
    @books = []
    @music_albums = []
    @genres = []
    @games = []
    @authors = []
  end

  def list_all_books
    @books = file_read('data/books.json')
    puts 'No books found' if @books.empty?
    @books.each do |book|
      puts "Publish date: #{book['publish_date']}", "Publisher: #{book['publisher']}",
           "Cover state: #{book['cover_state']}"
    end
    puts ' '
  end

  def list_all_labels
    @labels = file_read('data/labels.json')
    puts 'No labels found' if @labels.empty?
    @labels.each do |label|
      puts "Title: #{label['title']}", "Color: #{label['color']}"
    end
    puts ' '
  end

  def add_a_book
    puts "Enter the book's publish date:"
    publish_date = gets.chomp
    puts "Enter the book's publisher:"
    publisher = gets.chomp
    puts "Enter the book's cover state (Good/bad):"
    cover_state = gets.chomp
    @books << Book.new(publish_date, publisher, cover_state).to_hash
    puts 'Book added!'
    puts ' '
    file_write('./data/books.json', @books)
  end

  def list_all_music_albums
    @music_albums = file_read('data/music_albums.json')
    puts 'No music albums found' if @music_albums.empty?
    @music_albums.each do |album|
      puts "ID: #{album['id']}",
           "Publish Date: #{album['publish_date']}, On Spotify: #{album['on_spotify']}"
    end
    puts ' '
  end

  def list_all_genres
    @genres = file_read('data/genres.json')
    puts 'No Genres found' if @genres.empty?
    @genres.each do |genre|
      puts "ID: #{genre['id']}, Name: #{genre['name']}"
    end
    puts ' '
  end

  def add_a_music_album
    puts 'Enter the albums publish date:'
    publish_date = gets.chomp
    puts 'Is the album on spotify? (Y/N)'
    on_spotify = gets.chomp
    on_spotify = true if %w[Y y].include?(on_spotify)
    on_spotify = false if %w[N n].include?(on_spotify)
    @music_albums << MusicAlbum.new(publish_date, on_spotify).to_hash
    file_write('./data/music_albums.json', @music_albums)
    puts 'Music album added!'
    puts ' '
  end

  def list_of_games
    @games = file_read('data/games.json')
    puts 'No games found' if @games.empty?
    @games.each do |game|
      puts "ID: #{game['id']}, Publish Date: #{game['publish_date']}",
            "Multiplayer: #{game['multiplayer']}, Last Played: #{game['last_played']}"
    end
    puts ' '
  end

  def list_all_authors
    @authors = file_read('data/authors.json')
    puts 'No authors found' if @authors.empty?
    @authors.each do |author|
      puts "ID: #{author['id']}, Firstname: #{author['firstname']}, #{author['lastname']}"
    end
    puts ' '
  end

  def add_a_game
    puts 'When was this game published?'
    publish_date = gets.chomp
    puts 'Does the game support multiplayer? (Y/N)'
    multiplayer = gets.chomp
    multiplayer = true if %w[Y y].include?(multiplayer)
    multiplayer = false if %w[N n].include?(multiplayer)
    puts 'When was the game last played? (e.g 2020-01-01)'
    last_played = gets.chomp
    @games << Game.new(publish_date, multiplayer, last_played).to_hash
    file_write('data/games.json', @games)
    puts 'Game added'
    puts ' '
  end

end
