require "rails_helper"
RSpec.describe Booking, type: :model do
  subject(:booking) { Booking.new }

  let(:flight_id) { 45 }
  let(:no_of_pass) { 2 }
  let(:conf_code) { 109 }

  before(:each) do
    booking.flight_id = 45
    booking.no_of_passenger = 2
    booking.confirmation_code = 109
    booking.save
  end

  context "booking with all params" do
    it { is_expected.to be_valid }
  end

  context "booking with invalid attributes" do
    it "" do
      booking.flight_id = ""
      expect(booking.save).to eq false
    end

    it "" do
      booking.no_of_passenger = ""
      expect(booking.save).to eq false
    end

    it "" do
      booking.flight_id = ""
      booking.no_of_passenger = ""
      expect(booking.save).to eq false
    end
  end

  context ".find_booking" do
    describe "returns nil if no booking has the supplied booking code" do
      bcode = 1
      it { expect(Booking.find_booking(bcode)).to eq nil }
    end

    describe "returns booking if a booking has the supplied booking code" do
      bcode = 109
      it { expect(Booking.find_booking(bcode)).to eq booking }
    end
  end
end
