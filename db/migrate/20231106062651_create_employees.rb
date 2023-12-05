class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :contact
      t.string :address
      t.references :department, null: false, foreign_key: true
      t.references :leavetype, null: false, foreign_key: true
      t.references :salary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
