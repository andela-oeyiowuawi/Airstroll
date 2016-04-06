require "rails_helper"
RSpec.describe Flight, type: :model do
  flight = Flight.new

  before(:all) do
    flight.from_id = 1
    flight.to_id = 2
    flight.dept_date = Time.at(Time.now.to_i + (24 * 60 * 60 * 2))
    flight.dept_time = "6:00am"
    flight.flight_code = "AS#{Random.new.rand(100)}"
    flight.price = "18_000"
    flight.airplane_id = 2
    flight.save
    Flight.create(from_id: 1, to_id: 2,
                  dept_date: Time.at(Time.now.to_i + (24 * 60 * 60 * 1)))
    Flight.create(from_id: 4, to_id: 5,
                  dept_date: Time.at(Time.now.to_i - (24 * 60 * 60 * 1)))
  end
  it { is_expected.to belong_to(:from).class_name("Airport") }
  it { is_expected.to belong_to(:to).class_name("Airport") }
  it { is_expected.to belong_to(:airplane) }
  it { is_expected.to have_many(:bookings).with_foreign_key(:flight_id) }

  context ".search_flight" do
    context "search flight" do
      describe "without date" do
        let(:from_a) { 1 }
        let(:to_a) { 2 }
        it { expect(Flight.search_flight(from_a, to_a).count).to eq(2) }
      end
      describe "with date" do
        let(:example) { Flight.first }
        let(:from_a) { 1 }
        let(:to_a) { 2 }
        let(:date) { Flight.first.dept_date }
        it "" do
          expect(Flight.search_flight(from_a, to_a, date).first).to eq(example)
        end
      end
    end
  end

  context ".available" do
    it { expect(Flight.available.count).to eq(2) }
  end
end
