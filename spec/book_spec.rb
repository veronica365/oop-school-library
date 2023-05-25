require_relative '../book'

describe Book do
  before :each do
    @book = Book.new 'Fashion Star', 'Queen'
  end

  it 'checking book instance' do
    expect(@book).to be_instance_of Book
  end

  it 'checking attributes' do
    expect(@book).to have_attributes(title: 'Fashion Star', author: 'Queen')
  end

  it 'test for add_rental' do
    person = double('Person', rentals: [])
    allow(person).to receive(:age) { '28' }
    allow(person).to receive(:name) { 'Queen' }
    allow(person).to receive(:parent_permission) { true }
    rental = @book.add_rental('2023-05-24', person)
    expect(rental.person.name).to eq('Queen')
  end
end
