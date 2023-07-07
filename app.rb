require './data/preserve_data'
require './classes/item'
require './classes/book'
require './classes/genre'
require './classes/music_album'
require './classes/game'
require './classes/author'

class App
  attr_accessor :books, :labels, :items, :music_albums, :genres, :games, :authors

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
    @books.each_with_index do |book, index|
      puts "#{index} - Publish Date: #{book['publish_date']}",
           "Publisher: #{book['publisher']}, Cover State: #{book['cover_state']}"
    end
  end

  def list_all_music_albums
    @music_albums = file_read('data/music_albums.json')
    puts 'No music albums found' if @music_albums.empty?

    @music_albums.each_with_index do |album, index|
      puts "#{index} - #{album['id']}",
           "Publish Date: #{album['publish_date']}, On Spotify: #{album['on_spotify']}"
    end
  end

  def list_of_games
    puts 'games'
    @games = file_read('data/games.json')
    puts 'No games found' if @games.empty?

    @games.each_with_index do |game, index|
      puts "#{index} - #{game['id']}",
           "Publish Date: #{game['publish_date']}"
      "Multiplayer: #{game['multiplayer']}, Last played at: #{game['last_played_at']}"
    end
  end

  def list_all_genres
    @genres = file_read('data/genres.json')
    puts 'No Genres found' if @genres.empty?

    @genres.each_with_index do |genre, index|
      puts "#{index} - Name: #{genre['name']}"
    end
  end

  def list_all_authors
    @authors = file_read('data/authors.json')
    puts 'No Authors found' if @authors.empty?

    @authors.each_with_index do |author, index|
      puts "#{index} - Name: #{author['firstname']} #{author['lastname']}"
    end
  end

  def add_a_music_album
    puts 'Enter the albums publish date:'
    publish_date = gets.chomp
    puts 'Is the album on spotify? (Y/N)'
    on_spotify = gets.chomp
    on_spotify = true if %w[Y y].include?(on_spotify)
    on_spotify = false if %w[N n].include?(on_spotify)

    genres = file_read('data/genres.json')
    authors = file_read('data/authors.json')

    puts 'Choose a genre by index:'
    list_all_genres
    genre_index = gets.chomp.to_i

    puts 'Choose an author by index:'
    list_all_authors
    author_index = gets.chomp.to_i

    genre = genres[genre_index]['name']
    author = "#{authors[author_index]['firstname']} #{authors[author_index]['lastname']}"

    @music_albums << MusicAlbum.new(publish_date, on_spotify, genre, author).to_hash
    puts 'Music album added!'
    file_write('./data/music_albums.json', @music_albums)
  end

  def add_a_book
    puts 'Enter publisher : '
    publisher = gets.chomp
    puts 'Enter publish date : '
    publish_date = gets.chomp
    puts 'Enter a genre'

    puts 'Choose a genre by index:'
    list_all_genres
    genre_index = gets.chomp.to_i

    puts 'Choose an author by index:'
    list_all_authors
    author_index = gets.chomp.to_i

    genre = genres[genre_index]['name']
    author = "#{authors[author_index]['first_name']} #{authors[author_index]['last_name']}"

    book = Book.new(publisher, publish_date, genre, author)
    @books << book
    file_write('./data/books.json', @books)
  end

  def add_a_game
    puts 'add a game'
    puts 'Enter the game publish date:'
    publish_date = gets.chomp
    puts 'Is the game multiplayer? (Y/N)'
    multiplayer = gets.chomp
    multiplayer = true if %w[Y y].include?(multiplayer)
    multiplayer = false if %w[N n].include?(multiplayer)
    puts 'Last time the game was played'
    last_played_at = gets.chomp
    @games << Game.new(publish_date, multiplayer, last_played_at)
    puts 'Game added!'
    file_write('./data/games.json', @games)
  end

  def add_a_genre
    puts 'Enter genre name : '
    name = gets.chomp

    genre = Genre.new(name)
    @genres << genre
    file_write('./data/genres.json', @genres)
    puts 'Genre added!'
  end

  def add_an_author
    puts 'Enter first name : '
    first_name = gets.chomp
    puts 'Enter last name : '
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    @authors << author
    file_write('./data/authors.json', @authors)
    puts 'Author added!'
  end
end
