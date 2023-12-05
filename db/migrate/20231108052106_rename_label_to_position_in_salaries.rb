class RenameLabelToPositionInSalaries < ActiveRecord::Migration[7.1]
  def change
    rename_column :salaries, :label, :position
  end
end
