class CreateLeavetypes < ActiveRecord::Migration[7.1]
  def change
    create_table :leavetypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
