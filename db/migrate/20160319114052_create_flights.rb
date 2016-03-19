class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :from_id
      t.integer :to_id
      t.date :dept_date
      t.string :dept_time
      t.string :flight_code
      t.string :price
      t.integer :airplane_id
      t.string :duration

      t.timestamps null: false
    end
  end
end
