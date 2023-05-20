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
    if @namerable.correct_name.length > 10
      return @namerable.correct_name[0..9]
    end

    @namerable.correct_name
  end
end
