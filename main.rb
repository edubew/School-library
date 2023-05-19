require_relative 'app'

def main
    app = App.new

    loop do
        puts '--- School Library App ---'
        puts 'Select an option:'
        puts '1) List all books'
        puts '2) List all people'
        puts '3) Create a person'
        puts '4) Create a book'
        puts '5) Create a rental'
        puts '6) List all rentals for a person'
        puts '7) Quit'

        option = gets.chomp.to_i

        case option
        when 1
            app.list_all_books
        when 2
            app.list_all_people
        when 3
            app.create_person
        when 4
            app.create_book
        when 5
            app.create_rental
        when 6
            app.list_rentals
        when 7
            puts 'Exiting the app...'
            break
        else
            puts 'Invalid option! Please enter a valid position'
        end

        puts 'Press enter to continue...'
        gets.chomp
        system('clear')
    end
end