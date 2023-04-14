class Rental
  def initialize(person, book)
    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end
end
