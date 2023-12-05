class Department < ApplicationRecord
    validates :department_name, presence:true

    has_many :employees
    def self.ransackable_associations(auth_object = nil)
        ["employees"]
    end
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "department_name", "id", "id_value", "updated_at"]
    end
end
