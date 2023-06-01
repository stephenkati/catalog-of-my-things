require './app'

def display_prompts
  puts 'Welcome to catalog of my things'
  puts ' '
  puts 'Choose an option from choices below:'

  puts '1 - List all books'
  puts '2 - List all music albums'
  puts '3 - List of games'
  puts "4 - List all genres (e.g 'Comedy', 'Thriller')"
  puts "5 - List all labels (e.g. 'Gift', 'New')"
  puts "6 - List all authors (e.g. 'Stephen King')"
  puts '7 - Add a book'
  puts '8 - Add a music album'
  puts '9 - Add a game'
  puts '10 - Exit'
  puts ' '
end

loop do
  app = App.new
  display_prompts
  option = gets.chomp.to_i
  case option
  when 1
    app.list_all_books
  when 2
    app.list_all_music_albums
  when 3
    app.list_of_games
  when 4
    app.list_all_genres
  when 5
    app.list_all_labels
  when 6
    app.list_all_authors
  when 7
    app.add_a_book
  when 8
    app.add_a_music_album
  when 9
    app.add_a_game
  when 10
    puts 'Thanks for using our catalog, see you soon.'
    break
  else
    'Option is Invalid!'
  end
end
