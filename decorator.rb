require "numerable"

class Decorator < Namerable
    def initialize(namerable)
        super()
        @namerable = namerable
    end

    def correct_name
        @namerable.correct_name
    end
end
