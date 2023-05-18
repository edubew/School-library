require_relative './nameable'

class Person < Nameable
  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = rand(1..100)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def correct_name
    @name
  end

  # Public method to return true if the person is of age or has permission from parents
  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
