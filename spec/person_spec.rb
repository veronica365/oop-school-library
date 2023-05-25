require_relative '../person'

describe Person do
  before :each do
    @person = Person.new(28, 'Queen')
  end

  it 'checking person instance' do
    expect(@person).to be_instance_of Person
  end

  it 'checking attributes' do
    expect(@person).to have_attributes(age: 28, name: 'Queen')
  end

  it 'test for add_rental' do
    book = double('book', rentals: [])
    allow(book).to receive(:title) { 'Fashion Star' }
    allow(book).to receive(:author) { 'Queen' }
    rental = @person.add_rental('2023-05-24', book)
    expect(rental.book.title).to eq('Fashion Star')
  end

  it 'correct name method' do
    expect(@person.correct_name).to eq('Queen')
  end

  it 'can use services' do
    expect(@person.can_use_services?).to be true
  end
end
