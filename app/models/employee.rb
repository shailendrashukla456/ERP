class Employee < ApplicationRecord
  belongs_to :department
  belongs_to :leavetype
  belongs_to :salary
  

  validates :name, presence:true, format: { with: /\A[a-zA-Z]+\z/ }
  validates :email, presence:true, format: { with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+\z/}, uniqueness: true
  validates :password, presence:true ,length: { minimum: 6, maximum: 8}, format: { with: /\A[0-9]+\z/}
  validates :contact, presence:true, length: { minimum: 10, maximum: 12}, format: { with: /\A[0-9]+\z/}
  validates :address, presence:true,length: { minimum: 5, maximum: 15}
  
  def self.ransackable_attributes(auth_object = nil)
    ["address", "contact", "created_at", "department_id", "email", "id", "id_value", "leavetype_id", "name", "password", "salary_id", "updated_at"]
  end
end
