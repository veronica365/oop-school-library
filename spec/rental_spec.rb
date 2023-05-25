require_relative '../rental'
require_relative '../student'
require_relative '../book'

student = Student.new(18, 'test-student', true)
book = Book.new('The men who built america', 'Amazon Prime')
rental = Rental.new('2023/05/25', student, book)

RSpec.describe 'Rental class tests' do
  it 'should be able to return the correct date of the rental' do
    expect(rental.date).to eq('2023/05/25')
  end

  it 'should be able to correct person that rented a book' do
    expect(rental.person).to be student
  end

  it 'should be able to correct book that was rented out' do
    expect(rental.book).to be book
  end

  it 'should be able to correct number of rentals a book has' do
    expect(rental.book.rentals.count).to eql(1)
  end

  it 'should be able to add a rental from the book class' do
    book.add_rental('2023/05/24', student)
    expect(rental.book.rentals.count).to eql(2)
  end
end
