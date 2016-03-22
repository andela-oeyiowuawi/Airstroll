class AddSeatToAirplanes < ActiveRecord::Migration
  def change
    add_column :airplanes, :seats, :integer
  end
end
