class AddConfirmationCodeFromBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :confirmation_code, :string
  end
end
