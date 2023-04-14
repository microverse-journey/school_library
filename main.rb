class App
  attr_reader :books, :people

  def initialize
    introduction
    # user input
    @option = gets.chomp
    @books = []
    @people = []
    option(@option)
  end

  def add_book(title, author)
    print 'Please enter book title: '
    title = gets.chomp
    print 'Please enter book author: '
    author = gets.chomp
    @books << Book.new(title, author)
    print "book titled #{title} and written by #{author} added successfully"
  end

  def introduction
    puts ''
    puts '             OOP SCHOOL LIBRARY'
    puts '----------------------------------------------------'
    puts ''
    puts 'Please choose an option by entering a number:'
    puts ''
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts ''
    print 'Enter number: '
  end

  def option(option)
    case option
    when '1' then puts self.books
    when '2' then add_book
    when '3' then add_book
    when '4' then app.new_book
    when '5' then app.new_rental
    when '6' then app.list_rentals
    else
      puts 'That is not a valid option'
    end
  end
end

def main
  App.new
end

main
