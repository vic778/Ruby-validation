module Validatable

    @@validations={}
    # I need receive = {presence: [:weight, :length], aircraft_type: [:length]}

    def self.validates_presence_of(*attrs)
        @@validations[:presence] = attrs
    end

    def validate 
        @@validations.each do |v, fields| 
            fields.each {|field_name| self.send("validate_#{v}_of", field_name)}
        end
    end

    private 

    def validate_presence_of(field_name)
    end
end