require "rails_helper"
RSpec.feature "Flights", type: :feature do
  before do
    Capybara.default_driver = :selenium
    OmniAuth.config.test_mode = true
    seed = Seeds.new
    seed.create_airports
    seed.create_flight
  end

  scenario "home page" do
    visit "/"
    expect(page).to have_content("Welcome To Airstroll")
  end
  context "search for flight", js: true do
    scenario "that has no result" do
      visit root_path
      select "Nnamdi Azikwe International Airport", from: "from_airport"
      select "Dubai International Airport", from: "to_airport"
      select "1", from: "num_pass"
      click_button "fsearch"
      expect(page).to have_content("There is no result that match your search")
    end
    scenario "that is available", js: true do
      visit root_path
      select "Murtala Muhammed International Airport", from: "from_airport"
      select "Nnamdi Azikwe International Airport", from: "to_airport"
      select "2", from: "num_pass"
      click_button "fsearch"
      within("tbody") do
        expect(page).to have_selector("tr",count: 1)
      end
    end
    scenario "that hasn't departed" do
      visit "flight/all"
      within("tbody") do
        expect(page).to have_selector("tr", count: 2)
      end
    end
  end

end
