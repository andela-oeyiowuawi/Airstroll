require "rails_helper"
RSpec.describe Booking, type: :model do
  subject(:booking) { Booking.new }

  before(:each) do
    booking.flight_id = 45
    booking.no_of_passenger = 2
    booking.confirmation_code = "CQMG6TPW"
    booking.user_id = 1
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
      bcode = "ABCDQG6W"
      it { expect(Booking.find_booking(bcode)).to eq nil }
    end

    describe "returns the correct booking when supplied the right details" do
      it "" do
        expect(Booking.find_booking(booking.confirmation_code)).to eq booking
      end
    end
  end

  describe "generate_confirmation_code" do
    it { expect(booking.generate_confirmation_code.length).to eq 8 }
  end

  describe "generate_confirmation_code" do
    let(:generate_confirmation_code) { "ABCDEFER" }
    it { expect(booking.get_confirmation_code.length).to eq 8 }
  end
end
