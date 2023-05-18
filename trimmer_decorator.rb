require_relative './person'
require_relative './base_decorator'
require_relative './capitalize_decorator'

class TrimmerDecorator < Decorator
    MAX_LENGTH = 10

    def correct_name
        name = @nameable.correct_name
        name.length > MAX_LENGTH ? name[0...MAX_LENGTH] : name
    end
end

person = Person.new(22, name: 'maximilianus', parent_permission: true)
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name