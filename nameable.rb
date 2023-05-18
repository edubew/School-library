# Create a class nameable a method correct_name which raises a NotImplementedError
# with a message indicating that the correct name must be added

class Nameable
  def correct_name
    raise NotImplementedError, 'Must implement the correct name'
  end
end
