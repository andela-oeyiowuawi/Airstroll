class ChangeConfirmationCodeType < ActiveRecord::Migration
  def change
    change_column :bookings, :confirmation_code, :string 
  end
end
