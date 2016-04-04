class Passenger < ActiveRecord::Base
  belongs_to :booking, foreign_key: :booking_id
  has_one :flight, through: :booking
  validates :name, presence: true
	validates :email, presence: true
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  }
end
