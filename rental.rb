class Rental
  attr_accessor :date

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    @book.rentals.push(self)
    @person.rentals.push(self)
  end
end
