require "rails_helper"

RSpec.describe Airplane, type: :model do
  let(:airplane) { Airplane.new(name: name, code: code, airline_id: airline) }
  let(:name) { "Lightweight Fighter" }
  let(:code) { "MiG-21" }
  let(:airline) { 23 }
  before(:each) do
    airplane.save
  end
  it { is_expected.to belong_to(:airline) }
end
