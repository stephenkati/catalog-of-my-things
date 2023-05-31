require './classes/item'
require './classes/book'
require './classes/label'
require './classes/genre'
require './classes/music_album'
require './data/preserve_data'

class App
  attr_accessor :books, :labels, :items, :music_albums, :genres

  def initialize
    @items = []
    @labels = []
    @books = []
    @music_albums = []
    @genres = []
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
    puts 'Music album added!'
    puts ' '
    file_write('./data/music_albums.json', @music_albums)
  end
end
