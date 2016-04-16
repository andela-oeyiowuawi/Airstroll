require "rails_helper"
RSpec.feature "Flights", type: :feature do
  before do
    Capybara.default_driver = :selenium
    seed = Seeds.new
    seed.create_airports
    seed.create_flight
    page.driver.browser.manage.window.maximize
  end

  scenario "home page" do
    visit "/"
    expect(page).to have_content("Airstroll")
  end
  context "search for flight", js: true do

    scenario "that has no result" do
      visit root_path

      select "Nnamdi Azikwe International Airport", from: "from_airport"
      select "Dubai International Airport", from: "to_airport"

      find("#fsearch").click

      expect(page).to have_content("There are no Flights that matches Your "\
       "search. Try to search again")
    end
    scenario "that is available", js: true do
      visit root_path
      select "Murtala Muhammed International Airport", from: "from_airport"
      select "Nnamdi Azikwe International Airport", from: "to_airport"

      find("#fsearch").click

      expect(page).to have_content("BOOK", count: 1)
    end
  end
end
