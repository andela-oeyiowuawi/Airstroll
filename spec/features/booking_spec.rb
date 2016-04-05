require "rails_helper"
RSpec.feature "Flights", type: :feature , js: true do
  before do
    Capybara.default_driver = :selenium
    OmniAuth.config.test_mode = true
    seed = Seeds.new
    seed.create_airports
    seed.create_flight
  end

  context "anonymous user" do
    scenario "book flight" do
      visit root_path
      select "Murtala Muhammed International Airport", from: "from_airport"
      select "Nnamdi Azikwe International Airport", from: "to_airport"
      select "2", from: "num_pass"
      click_link "bkfl"

    end

  end

end
