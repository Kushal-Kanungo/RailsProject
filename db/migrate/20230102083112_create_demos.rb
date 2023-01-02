class CreateDemos < ActiveRecord::Migration[7.0]
  def change
    create_table :demos do |t|
      t.string :demo_name
      t.string :desc

      t.timestamps
    end
  end
end
