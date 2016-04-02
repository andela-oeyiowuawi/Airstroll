class Passenger < ActiveRecord::Base
  belongs_to :booking, foreign_key: :booking_id
  has_one :flight, through: :booking
end
