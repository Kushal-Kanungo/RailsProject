class AddDummyRecordsToDemo < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        10.times do |i|
          puts "Creating demo data #{i + 1}"
          Demo.create(
            demo_name: "Demo Name #{i + 1}",
            desc: 'Just Body'
          )
        end
      end
      dir.down do
        10.times do |i|
          puts "deleting  demo data #{i + 1}"
          Demo.find_by(demo_name: "Demo Name #{i + 1}").destroy
        end
      end
    end
  end
end
