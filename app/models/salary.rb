class Salary < ApplicationRecord
    validates :amount, presence:true
    validates :position, presence:true

    has_one :employee
    
    def self.ransackable_associations(auth_object = nil)
        ["employee"]
    end
    def self.ransackable_attributes(auth_object = nil)
        ["amount", "created_at", "id", "id_value", "position", "updated_at"]
    end
end 
