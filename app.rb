require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
    def initialize
        @people = []
        @books = []
        @rentals = []
    end

    # List of all the books
    def list_all_books
        if @books.empty?
            puts 'No books available. Please add books.'
        else
            @books.each do |book|
                puts "Title: #{book.title}, Author: #{book.author}"
            end
        end
    end

    # List of all registered people
    def list_all_people
        if @people.empty?
            puts 'Please register some people'
        else
            @people.each do |person|
                puts "[#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
            end
        end
    end

    # Create a person (either a student or a teacher) based on a user input
    def create_person
        puts 'Do you want to create a student (1) or a teacher (2)?'
        option = gets.chomp

        case option
        when '1'
            create_student
        when '2'
            create_teacher
        else
            puts 'Invalid input! Please type 1 or 2.'
        end
    end

    # Create a student based on user inputs
    def create_student
        print 'Name: '
        name = gets.chomp

        print 'Age: '
        age = gets.chomp.to_i

        print 'Has parent permission? [Y/N]: '
        parent_permission = gets.chomp.downcase

        student = Student.new(name, age, parent_permission: parent_permission == 'y')
        @people << student
        puts 'Student created successfully.'
    end

    # Create a student based on user input
    def create_teacher
        print 'Name: '
        name = gets.chomp

        print 'Age: '
        age = gets.chomp.to_i

        print 'Specialization: '
        specialization = gets.chomp

        @people << Teacher.new(name, age, specialization)
        puts 'Teacher created successfully'
    end

    # Create a book based on user inputs
    def create_book
        print 'Title: '
        title = gets.chomp

        print 'Author: '
        author = gets.chomp

        @books << Book.new(title, author)
        puts 'Book created successfully'
    end

    # Create a rental based on user input
    def create_rental
        puts 'Select a book from the list by number: '
        @books.each_with_index do |book, index|
            puts "#{index}) Title: #{book.title}, Author: #{book.author}"
        end

        book_id = gets.chomp.to_i

        puts 'Select a person from the list by number: '
        @people.each_with_index do |person, index|
            puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end

        person_id = gets.chomp.to_i

        print 'Date: '
        date = gets.chomp

        @rentals << Rental.new(date, @books[book_id], @people[person_id])
        puts 'Rental created successfully.'
    end

    # List all rentals for a given person id.
    def list_rentals
        print 'Person ID: '
        id = gets.chomp.to_i

        rentals = @rentals.select { |rental| rental.person.id == id }

        if rentals.empty?
            puts 'No rentals found for the specified person ID.'
        else
            puts 'Rentals: '
            rentals.each do |rental|
                puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
            end
        end
    end
end
