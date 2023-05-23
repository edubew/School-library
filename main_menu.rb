class MainMenu
    def initialize
      @library_app = LibraryApp.new
    end
  
    def menu_option(option)
      case option
      when '1'
        @library_app.list_all_books
      when '2'
        @library_app.list_all_people
      when '3'
        @library_app.create_person
      when '4'
        @library_app.create_book
      when '5'
        @library_app.create_rental
      when '6'
        @library_app.list_rentals
      else
        puts 'Please enter a number between 1 and 7'
      end
    end
  
    def run
      puts '---School Library Application---'
      loop do
        PrintMenu.print_menu
        option = gets.chomp
        if option == '7'
          puts 'Thank you for using our library'
          return
        end
        menu_option(option)
      end
    end
  end
  