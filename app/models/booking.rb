
class Booking < ActiveRecord::Base
  has_many :passengers, dependent: :destroy
  belongs_to :flight
  belongs_to :user, foreign_key: :user_id
  accepts_nested_attributes_for :passengers, reject_if: :all_blank,
                                             allow_destroy: true
  validates :flight_id, presence: true
  validates :no_of_passenger, presence: true

  def self.find_booking(bcode)
    find_by(confirmation_code: bcode)
  end
end
