require "rails_helper"
RSpec.describe Booking, type: :model do
  subject(:booking) { Booking.new(flight_id: flight_id, no_of_passenger: no_of_pass, confirmation_code: conf_code) }
  let(:flight_id) { 45 }
  let(:no_of_pass) { 2 }
  let(:conf_code) { 109 }

  before(:each) do
    booking.save
  end

  context "booking with all params" do
    it { is_expected.to be_valid }
  end

  context "booking with invalid attributes" do
    let(:flight_id) { "" }
    it { is_expected.to be_invalid }

    let(:no_of_passengers) { "" }
    it { is_expected.to be_invalid }

    let(:flight_id) { "" }
    let(:no_of_passengers) { "" }
    it { is_expected.to be_invalid }
  end

  context ".find_booking" do
    describe "returns nil if no booking has the supplied booking code" do
      let(:bcode) { 1 }
      it { expect(Booking.find_booking(bcode)).to eq nil }
    end

    describe "returns booking if a booking has the supplied booking code" do
      let(:bcode) { 109 }
      it { expect(Booking.find_booking(bcode)).to eq booking }
    end
  end
end
