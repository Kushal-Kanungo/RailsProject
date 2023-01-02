class ChangeTypeInDemos < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      # When we update the migration
      dir.up do
        change_column :demos, :desc, :text
      end
      
      # Down when we rollback the migration
      dir.down do |dir|
        change_column :demos, :desc, :string 
      end
    end
  end
end
