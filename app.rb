require_relative "person"
require_relative "student"
require_relative "teacher"

class App
  def initialize
    @people = []
    @students = []
    # @options = options
  end

  def list_books
  end

  def list_people
    puts "Listing books:"
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    puts "\nbooks"
  end

  def create_user(choice)
    print "Age: "
    age = gets.chomp.to_i
  
    print "Name: "
    name = gets.chomp
  
    optional_param = ""
    if(choice==1)
        print "Has parent permission? [Y/N]: "
        optional_param = gets.chomp
        optional_param = optional_param.upcase == "Y" ? true : false
    end

    if(choice==2)
        print "Specialization: "
        optional_param = gets.chomp
    end
    return age, name, optional_param
  end

  def create_student
    puts "\nCreating a student"
    @people << Student.new(create_user(1))
    puts "Student created successfully\n"
  end

  def create_teacher
    puts "\nCreating a teacher"
    @people << Teacher.new(create_user(2))
    puts "Teacher created successfully\n"
  end

  def create_person
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    choice = gets.chomp
    return create_student if choice == "1"
    return create_teacher if choice == "2"
    puts "Invalid choice."
  end

  def create_rental
  end

  def person_rentals
  end
end

app = App.new
app.create_person
