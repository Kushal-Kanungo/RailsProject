class DeleteColumnsToDemos < ActiveRecord::Migration[7.0]
  def change
    remove_column :demos, :dob, :date
  end
end
