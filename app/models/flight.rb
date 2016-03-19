class Flight < ActiveRecord::Base
  belongs_to :from, class_name: "Airport"
  belongs_to :to, class_name: "Airport"
  has_many :bookings, class_name: "Booking", foreign_key: :flight_id
end
