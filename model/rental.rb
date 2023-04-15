class Rental
  attr_accessor :person, :book, :date

  def initialize(person, book, date)
    @book = book
    book.rentals << self

    @person = person
    person.rentals << self

    @date = date
  end
end
