require_relative './person'

class Student < Person
  def initialize(age, classroom, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    students = classroom.students
    students.push(self) unless students.include?(self)
  end
end
