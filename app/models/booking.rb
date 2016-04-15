
class Booking < ActiveRecord::Base
  has_many :passengers, dependent: :destroy
  belongs_to :flight
  belongs_to :user, foreign_key: :user_id
  accepts_nested_attributes_for :passengers, reject_if: :all_blank,
                                             allow_destroy: true
  validates :flight_id, presence: true
  validates :no_of_passenger, presence: true

  before_create :get_confirmation_code

  def self.find_booking(bcode, id)
    where(confirmation_code: bcode, user_id: id).first
  end

  def generate_confirmation_code
    charsett = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    (0..7).map{ charsett[rand(charsett.size)] }.join
  end

  def get_confirmation_code
    self.confirmation_code = generate_confirmation_code
  end
end
