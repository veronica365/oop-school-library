require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'files'

class App
  def initialize
    @storage = Storage.new
    @books = @storage.load_books
    @people = @storage.load_people
    @rentals = @storage.load_rentals(@books, @people)
  end

  def list_books(message = 'All books')
    return print "\nWe have no books now\n" if @books.empty?

    puts "#{message unless message == 'All books'}\n"

    @books.each_with_index do |book, index|
      puts "#{index}) [#{book.class}] Title: #{book.title}, Author: #{book.author}"
    end
    puts "\n"
  end

  def list_people(message = 'All people')
    return print "\nWe have no users now\n" if @people.empty?

    puts "#{message unless message == 'All people'}\n"

    @people.each_with_index do |person, index|
      puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts "\n"
  end

  def list_rentals
    puts "\nAll rentals"
    return puts 'We have no rentals now' if @rentals.empty?

    print 'ID of the person: '
    id = gets.chomp.to_i

    puts "Rentals: by #{id}\n"
    person_rentals = @people.find { |person| person.id == id }

    return puts "Person with #{id} has no current rentals" if person_rentals.nil?

    puts "#{person_rentals.name} Rentals:-"
    person_rentals.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end

  def create_user(choice)
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    optional_param = ''
    if choice == 1
      print 'Has parent permission? [Y/N]: '
      optional_param = gets.chomp
      optional_param = optional_param.upcase == 'Y'
    end

    if choice == 2
      print 'Specialization: '
      optional_param = gets.chomp
    end
    [age, name, optional_param]
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
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp
    return create_student if choice == '1'
    return create_teacher if choice == '2'

    puts "Invalid choice.\n\n"
  end

  def create_book
    puts "\nCreating a book"
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts "Book created successfully\n\n"
  end

  def create_rental
    return puts "\nWe have no users now\n" if @people.empty?
    return puts "\nWe have no books now\n" if @books.empty?

    list_books('Select a book from the following list by number')
    book_id = gets.chomp.to_i

    renters_allowed = @people.select(&:can_use_services?)
    return puts "\nWe have no allowed now\n" if renters_allowed.empty?

    puts 'Select a person from the following list by number (not id): '
    renters_allowed.each_with_index do |person, index|
      puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    renter_person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    @rentals << Rental.new(date, renters_allowed[renter_person_id], @books[book_id])
    puts "Rental created successfully\n"
  end

  def save_on_exit
    @storage.save_books(@books)
    @storage.save_people(@people)
    @storage.save_rentals(@rentals)
    puts 'Books, people and rentals saved successfully'
  end
end
