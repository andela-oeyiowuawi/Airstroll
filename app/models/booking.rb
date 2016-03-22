class Booking < ActiveRecord::Base
  has_many :passengers, dependent: :destroy
  belongs_to :flight
end
