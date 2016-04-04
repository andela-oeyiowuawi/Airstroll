class Flight < ActiveRecord::Base
  belongs_to :from, class_name: 'Airport'
  belongs_to :to, class_name: 'Airport'
  belongs_to :airplane
  has_many :bookings, class_name: 'Booking', foreign_key: :flight_id

  def self.search_flight(from, to, dept_time = nil)
    if dept_time.nil? || dept_time == ''
      includes(:from, :to).where(to_id: to, from_id: from).order(price: :asc)
    else
      includes(:from, :to).where(to_id: to, from_id: from, dept_date: dept_time).order(dept_date: :asc)
    end
  end

  def self.available
    where('dept_date > ?', Time.now)
  end
end
