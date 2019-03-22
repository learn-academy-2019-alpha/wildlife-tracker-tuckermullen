class CreateSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :sightings do |t|
      t.integer :animal_id
      t.date :date
      t.string :time
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
