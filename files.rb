require "json"

class Storage
  def open_or_create_file(filename)
    File.open(filename, 'w')
  end

  def read_file_content(filename)
    return [] if !File.exist?(filename)
    file = File.open(filename, "r")
    file_data = file.read
    if file_data.empty?
      return []
    end
    file_content = JSON.parse(file_data)
    file.close
    file_content
  end

  def save_file_content(filename, content)
    file = open_or_create_file(filename)
    json_string = JSON.dump(content)
    file.write(json_string)
    file.close
  end

  def save_people(people)
    new_people = []
    people.each do |person|
      new_person = {
        "age" => person.age,
        "name" => person.name,
      }
      if person.class.to_s == "Student"
        new_person["parent_permission"] = person.parent_permission
      else
        new_person["specialization"] = person.specialization
      end
      new_people << new_person
    end
    save_file_content("people.json", new_people)
  end

  def save_books(books)
    new_books = []
    books.each do |book|
      new_book = {
        "title" => book.title,
        "author" => book.author,
      }
      new_books << new_book
    end
    save_file_content("books.json", new_books)
  end

  def save_rentals(rentals)
    new_rentals = []
    rentals.each_with_index do |rental, index|
      new_rental = {
        "person" => rental.person.name,
        "book" => rental.book.title,
      }
      new_rentals << new_rental
    end
    save_file_content("rentals.json", new_rentals)
  end

  def load_people
    people = []
    people_data = read_file_content("people.json")
    people_data.each do | person |
      if person.has_key?("specialization")
        people << Teacher.new(person["age"], person["name"], person["specialization"])
      else
        people << Student.new(person["age"], person["name"], person["parent_permission"])
      end
    end
    people
  end

  def load_books
    books = []
    book_data = read_file_content("books.json")
    book_data.each do | book |
      books << Book.new(book["title"], book["author"])
    end
    books
  end

  def load_rentals(books, people)
    rentals = []
    rental_data = read_file_content("rentals.json")
    rental_data.each do | rental |
      book = books.find { |item| item.title == rental["book"]}
      person = people.find { |person| person.name == rental["person"] }
      rentals << Rental.new(rental["date"], person, book)
    end
    rentals
  end
end
