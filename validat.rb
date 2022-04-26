module Validatable
  def validate_presence_of(*attributes)
    attributes.each do |attribute|
      define_method("#{attribute}=") do |value|
        instance_variable_set("@#{attribute}", value)
      end
      define_method(attribute.to_s) do
        instance_variable_get("@#{attribute}")
      end
      define_method("validate_#{attribute}") do
        errors.add(attribute, "can't be blank") if send(attribute).nil?
      end
    end
  end
end

class User
  include Validatable

  attr_accessor :name, :options

  def initialize(name, options = {})
    @name = name
    @number = options[:number]
  end

  def validate
    validate_presence_of(@name, @number)
  end

  def valid?
    return true if validate

    false
  end
end

# c = User.new(name = 'victor', number = 1234)
# puts c.name
# puts c.number
# puts c.validate
# puts c.valid?
