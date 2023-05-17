require_relative './person'

class Student < Person
    def initialize(id, age, name = "Unknown" parent_permission = true, classroom)
        @classroom = classroom
    end

    def play_hocky
        '¯\(ツ)/¯'
    end
end