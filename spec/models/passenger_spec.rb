require "rails_helper"
RSpec.describe Passenger, type: :model do
  let(:passenger) {Passenger.new(name: name, email: email)}
  let(:name) {"olalekan"}
  let(:email) {"olalekan@andela.com"}
  before(:each) do
    passenger.save
  end
  describe "booking with invalid passenger attributes" do
    let(:name) {""}
    it{ is_expected.to be_invalid}

    let(:email) {""}
    it{ is_expected.to be_invalid}
  end
  it { is_expected.to belong_to(:booking).with_foreign_key(:booking_id) }
  it { is_expected.to have_one(:flight).through(:booking) }
end
