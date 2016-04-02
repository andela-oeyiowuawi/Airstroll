class Booking < ActiveRecord::Base
  has_many :passengers, dependent: :destroy
  belongs_to :flight
  accepts_nested_attributes_for :passengers

  def self.find_booking(bcode)
    find_by(confirmation_code: bcode)
  end
end
