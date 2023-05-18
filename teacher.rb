require_relative './person'

class Teacher < Person
    def initialize(id, age, name = "Unknown", specialization)
        @specialization = specialization
    end

    def can_use_services?
        true
    end