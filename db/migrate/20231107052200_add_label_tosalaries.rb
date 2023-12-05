class AddLabelTosalaries < ActiveRecord::Migration[7.1]
  def change
    add_column :salaries, :label, :string
  end
end
