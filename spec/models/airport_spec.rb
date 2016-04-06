require "rails_helper"
RSpec.describe Airport, type: :model do
  let(:airport) {Airport.new(name: name, city: city, country: country)}
  let(:name) {"Murtala Muhammed International Airport"}
  let(:city) {"Lagos"}
  let(:country) {"Nigeria"}
  before(:each) do
    airport.save
  end
  it {is_expected.to have_many(:froms).with_foreign_key(:from_id)}
  it {is_expected.to have_many(:tos).with_foreign_key(:to_id)}
end
