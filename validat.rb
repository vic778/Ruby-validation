module Validatable
  def validate_presence_of(name, number)
    return unless name.nil? || number.nil?

    errors.add(:name, "can't be blank")
    errors.add(:number, "can't be blank")
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
