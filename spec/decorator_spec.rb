require './person'
require './decorators'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_erson = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_erson.correct_name

puts person.correct_name
puts capitalized_person.correct_name
puts capitalized_trimmed_erson.correct_name

RSpec.describe 'UnitTests' do
  it 'should not save article without title' do
    expect(person.correct_name.length).to be 12
  end

  it 'should not save article without title' do
    name = capitalized_trimmed_erson.correct_name
    expect(name.length).to be 10
  end
end
