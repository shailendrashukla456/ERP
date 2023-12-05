class Leavetype < ApplicationRecord
    validates :name, presence:true

    has_one :employee

    def self.ransackable_associations(auth_object = nil)
        ["employee"]
    end
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "id_value", "name", "updated_at"]
    end
end
