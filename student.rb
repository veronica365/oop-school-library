require_relative 'person'

class Student < Person
  def initialize(age, name = 'unknown', classroom = nil, parent_permission = true)
    super(age, name, parent_permission: parent_permission)
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
