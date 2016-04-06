require "rails_helper"

RSpec.describe Airline, type: :model do
  let(:airline) { Airline.new(name: name, code: code) }
  let(:name) { "Qatar Airways" }
  let(:code) { "QTA" }
  before(:each) do
    airline.save
  end
  it { is_expected.to have_many(:airplanes) }
end
