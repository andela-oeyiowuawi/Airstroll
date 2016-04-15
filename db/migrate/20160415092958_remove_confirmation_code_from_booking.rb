class RemoveConfirmationCodeFromBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :confirmation_code, :integer
  end
end
