require './person'
require './decorators'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_erson = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_erson.correct_name

RSpec.describe 'Decorator class tests' do
  it 'should be able to capitalize the the correct_name' do
    expect(capitalized_person.correct_name).to eq('Maximilianus')
  end

  it 'should be able to return the length of the correct name' do
    expect(person.correct_name.length).to be 12
  end

  it 'should be able trim the text to 10 characters' do
    name = capitalized_trimmed_erson.correct_name
    expect(name.length).to be 10
  end
end
