require_relative '../student'
require_relative '../classroom'

RSpec.describe 'Classroom class tests when adding student from classroom' do
  student = Student.new(34, 'test-teacher', true)
  classroom = Classroom.new('Ruby-class')
  student.add_classroom(classroom)

  it 'should be able to return the correct label from a classroom object' do
    expect(classroom.label).to eq('Ruby-class')
  end

  it 'should be able to return the correct label from a student object' do
    expect(student.classroom.label).to eq('Ruby-class')
  end

  it 'should be able to return the correct label from a student object to match classroom object' do
    expect(student.classroom.label).to eq(classroom.label)
  end

  it 'should be able to return the correct number of classrooms' do
    expect(classroom.students.count).to eq(1)
  end

  it 'should be able to return the correct number of classrooms for student' do
    expect(student.classroom.students.count).to eq(1)
  end
end

RSpec.describe 'Classroom class tests when adding classroom to student' do
  student = Student.new(34, 'test-teacher', true)
  classroom = Classroom.new('Database-class')

  it 'should be able to add classroom to student' do
    student.add_classroom(classroom)
    expect(student.classroom.label).to eq('Database-class')
  end

  it 'should be able to add a new classroom to student' do
    classroom = Classroom.new('Ruby-class')
    student.add_classroom(classroom)
    expect(student.classroom.label).to eq('Ruby-class')
  end

  it 'should be able to return the correct label from a student object to match classroom object' do
    student.add_classroom(classroom)
    expect(student.classroom.label).to eq(classroom.label)
  end

  it 'should be able to return the correct number of classrooms' do
    student.add_classroom(classroom)
    expect(classroom.students.count).to eq(1)
  end

  it 'should be able to return the correct number of classrooms for student' do
    student.add_classroom(classroom)
    expect(student.classroom.students.count).to eq(1)
  end
end
