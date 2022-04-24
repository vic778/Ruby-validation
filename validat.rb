module Validatable

   def validate_presence_of(*attributes)
        attributes.each do |attribute|
            puts "validating presence of #{attribute}"
             
        end
    end

    private 

    def validate_presence_of(name, number)
        if name.nil? || number.nil?
            errors.add(:name, "can't be blank")
            errors.add(:number, "can't be blank")
        end
    end

end

class User
    include Validatable
    
    attr_accessor :name, :number
    
    def initialize(name, number)
        @name = name
        @number = number
        
        # @number = options[:number].to_i

    end

    def validate
        validate_presence_of(@name, @number)
    end

    
    def valid?
        return true if validate
        false
    end
end


c = User.new(name = "vic", number = "123")
puts c.name
puts c.number
puts c.validate
puts c.valid?
