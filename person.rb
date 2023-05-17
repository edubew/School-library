class Person
    def initialize(name = "Unknown", age, parent_permission = true)
        @id = rand(1..100)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    attr_reader :id

    attr_accessor :name, :age

# Public method to return true if the person is of age or have permission from parents
   def can_use_services?
    of_age? || @parent_permission
   end
   
   private
   def of_age?
    @age >= 18
   end
end
