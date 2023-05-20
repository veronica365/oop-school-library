require_relative "person"
require_relative "student"
require_relative "teacher"

class App
  def initialize
    @books = []
    @people = []
    @students = []
  end

  def list_books
    puts "\nListing all books"
    @books.each do |book|
      puts "[#{book.class}] Title: #{book.title}, Author: #{book.author}"
    end
    puts "\n"
  end

  def list_people
    puts "\nListing all people"
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts "\n"
  end

  def list_rentals
  end

  def create_user(choice)
    print "Age: "
    age = gets.chomp.to_i

    print "Name: "
    name = gets.chomp

    optional_param = ""
    if (choice == 1)
      print "Has parent permission? [Y/N]: "
      optional_param = gets.chomp
      optional_param = optional_param.upcase == "Y" ? true : false
    end

    if (choice == 2)
      print "Specialization: "
      optional_param = gets.chomp
    end
    return age, name, optional_param
  end

  def create_student
    puts "\nCreating a student"
    @people << Student.new(*create_user(1))
    puts "Student created successfully\n\n"
  end

  def create_teacher
    puts "\nCreating a teacher"
    @people << Teacher.new(*create_user(2))
    puts "Teacher created successfully\n\n"
  end

  def create_person
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    choice = gets.chomp
    return create_student if choice == "1"
    return create_teacher if choice == "2"

    puts "Invalid choice.\n\n"
  end

  def create_book
    puts "\nCreating a book"
    print "Title: "
    title = gets.chomp

    print "Author: "
    author = gets.chomp

    @books << Book.new(title, author)
    puts "Book created successfully\n\n"
  end

  def create_rental
  end
end
