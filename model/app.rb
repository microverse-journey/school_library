require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_reader :books, :people

  def initialize
    introduction
    @books = []
    @people = []
    @options = {
      '1' => :list_books,
      '2' => :list_people,
      '3' => :add_person,
      '4' => :add_book,
      '5' => :add_rental,
      '6' => :list_rentals,
      '7' => :exit
    }
  end

  def add_book()
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter book author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts "book titled #{title} and written by #{author} added successfully"
  end

  def list_books
    puts ''
    puts '                     All Books'
    puts '----------------------------------------------------'
    puts @books.length.positive? ? @books : 'No books found, choose an option to add a book'
  end

  def list_people
    puts ''
    puts '                     All People'
    puts '----------------------------------------------------'
    puts @people.length.positive? ? @people : 'No Person found, choose an option to add a person'
  end

  def add_person()
    print 'Enter (1) to create a student and (2) to create a teacher? [input the number]: '
    input = gets.chomp
    if input == '1'
      add_student
    elsif input == '2'
      add_teacher
    else
      puts 'Wrong input'
    end
  end

  def add_student
    print 'Enter student name: '
    name = gets.chomp
    print 'Enter person age: '
    age = gets.chomp
    print 'Enter student classroom: '
    classroom = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    permission = permission == 'y'
    @people << Student.new(classroom, age, name, parent_permission: permission)
    puts 'Person created successfully'
  end

  def add_teacher
    print 'Enter teacher name: '
    name = gets.chomp
    print 'Enter teacher age: '
    age = gets.chomp
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    @people << Teacher.new(specialization, age, name)
    puts 'Person created successfully'
  end

  def add_rental
    puts 'Select a book from the following list by number'

    @books.each_with_index do |book, index|
      puts "#{index}) title: \"#{book.title}\" author: #{book.author}"
    end
    book = gets.chomp.to_i

    puts 'Select a person from the following list by number (not ID)'
    @people.each_with_index do |person, index|
      puts "#{index}) #{person}"
    end
    person = gets.chomp.to_i

    print 'Enter rental date: '
    date = gets.chomp

    @rentals << Rental.new(@people[person], @books[book], date)
    puts 'Rental created successfully'
  end

  def list_rentals
    puts 'Select a person from the following list by number (not ID)'
    @people.each_with_index do |person, index|
      puts "#{index}) #{person}"
    end
    person = gets.chomp.to_i
    rentals = @rentals.select { |rental| rental.person.id == person }

    puts ''
    if rentals.empty?
      puts 'No rentals for this person'
    else
      puts "         Rentals by #{@people[person].name}"
      puts '----------------------------------------------------'
      puts rentals
    end
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

  def actions(option)
    if @options[option]
      send(@options[option])
    else
      puts 'Invalid option'
    end
  end
  
end
