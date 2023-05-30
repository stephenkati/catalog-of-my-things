require './classes/item'
require './classes/book'
require './classes/label'
require './data/preserve_data'

class App
  attr_accessor :books, :labels, :items

  def initialize
    @items = file_read('data/items.json')
    @labels = file_read('data/labels.json')
    @books = file_read('data/books.json')
  end

  def list_all_books
    puts 'No books found' if @books.empty?
    @books.each do |book|
      puts"Publish date: #{book['publish_date']}", "Publisher: #{book['publisher']}",
      "Cover state: #{book['cover_state']}"
    end
    puts ' '
  end

  def list_all_labels
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
    puts "Book added!"
    puts ' '
    file_write('./data/books.json', @books)
  end

end
