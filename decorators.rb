require_relative 'numerable'

class DefaultDecorator < Namerable
  def initialize(namerable)
    super()
    @namerable = namerable
  end

  def correct_name
    @namerable.correct_name
  end
end

class CapitalizeDecorator < DefaultDecorator
  def correct_name
    @namerable.correct_name.capitalize
  end
end

class TrimmerDecorator < DefaultDecorator
  def correct_name
    name = @namerable.correct_name
    return name[0..9] if name.length > 10

    @namerable.correct_name
  end
end
