require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :parent_permission

  def initialize(age, name: 'Unkown', parent_permission: true)
    @id = nil
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def of_age?
    @age >= 18
  end
  private :of_age?

  def correct_name
    @name.capitalize
  end
end
