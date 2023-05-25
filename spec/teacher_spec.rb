require_relative '../teacher'

teacher = Teacher.new(34, 'test-teacher', 'Biology')

RSpec.describe 'Teacher class tests' do
  it 'should be able to return the correct id to be an Integer' do
    expect(teacher.id.class).to eq(Integer)
  end

  it 'should be able to return the correct name' do
    expect(teacher.name).to eq('test-teacher')
  end

  it 'should be able to return the correct age' do
    expect(teacher.age).to eq(34)
  end

  it 'should be able to return the correct specialization' do
    expect(teacher.specialization).to eq('Biology')
  end

  it 'should be able to return the correct can_use_services' do
    expect(teacher.can_use_services?).to eq(true)
  end
end
