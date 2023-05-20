require_relative "app"

class Main
  def initialize
    puts "Welcome to the School Library App!\n\n"
    @options = {
      1 => "List all books.",
      2 => "List all people.",
      3 => "Create a person (teacher or student, not a plain Person).",
      4 => "Create a book.",
      5 => "Create a rental.",
      6 => "List all rentals for a given person id.",
      7 => "Exit.",
    }
    @app = App.new
  end

  def print_options(options)
    puts "Please choose an option by entering a number:\n"
    options.each { |key, value| puts "#{key} - #{value}" }
  end

  def use_input(input)
    case input
    when "1"
      @app.list_books
    when "2"
      @app.list_people
    when "3"
      @app.create_person
    when "4"
      @app.create_book
    when "5"
      @app.create_rental
    else
      @app.list_rentals
    end
  end

  def main
    options = @options

    loop do
      print_options(options)
      user_input = gets.chomp
      next if not user_input.to_i.between?(1, 7)

      if user_input == "7"
        puts "Thanks for using the app!"
        return
      end
      use_input(user_input)
    end
  end
end

main = Main.new
main.main
