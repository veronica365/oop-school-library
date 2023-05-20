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
    @app = App.new(@options)
  end

  def print_options(options)
    puts "Please choose an option by entering a number:\n"
    options.each { |key, value| puts "#{key} - #{value}" }
  end

  def main
    options = @options

    loop do
      print_options(options)
      c = gets.chomp
      next if not c.to_i.between?(1, 7)
      if c == "7"
        puts "Thanks for using the app!"
        return
      end
      puts "You entered the character #{c}\n\n"
    end
  end
end

main = Main.new
main.main
