class CreateAirplanes < ActiveRecord::Migration
  def change
    create_table :airplanes do |t|
      t.string :name
      t.string :code
      t.integer :airline_id

      t.timestamps null: false
    end
  end
end
