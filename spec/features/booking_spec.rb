require "rails_helper"
RSpec.feature "Flights", type: :feature, js: true do
  before do
    Capybara.default_driver = :selenium
    seed = Seeds.new
    seed.create_airports
    seed.create_flight
    page.driver.browser.manage.window.maximize
  end

  context "anonymous user" do
    scenario "book flight with valid passenger detail", js: true do
      visit root_path
      select "Murtala Muhammed International Airport", from: "from_airport"
      select "Nnamdi Azikwe International Airport", from: "to_airport"
      click_button "fsearch"
      click_link "bkfl"

      find(".add_passenger").click
      fill_in "pass_name", with: "Olalekan Eyiowuawi"
      fill_in "pass_email", with: "olalekan.eyiowuawi@andela.com"

      click_button "Book Flight"
      expect(page).to have_content("Your Flight Has been successfully Booked.")
    end

    scenario "can't book flight with no passenger", js: true do
      visit root_path
      select "Murtala Muhammed International Airport", from: "from_airport"
      select "Nnamdi Azikwe International Airport", from: "to_airport"
      click_button "fsearch"
      click_link "bkfl"
      expect(page).to have_content("Add Passengers")
      click_button "Book Flight"
      expect(page).to have_content("You must have at least one passenger")
    end
  end
  context "logged in User" do
    scenario "can book flight with valid passenger detail", js: true do
      visit root_path
      click_on "Login"
      click_on "Facebook"
      set_valid_omniauth

      expect(page).to have_content("Signed")
      sleep 3
      visit "flight/all"
      first('#fl').click_link("Book")
      find(".add_passenger").click
      fill_in "pass_name", with: "Olalekan Eyiowuawi"
      fill_in "pass_email", with: "olalekan.eyiowuawi@andela.com"
      binding.pry
      click_button "Book Flight"
      expect(page).to have_content("Your Flight Has been successfully Booked.")
      click_on "Example User"
      click_on "Manage booking"
      fill_in "bcode", with: Booking.pluck(:confirmation_code).last
      click_button "Find Reservation"
      click_link "Edit"
      expect(page).to have_content("Add Passengers")
      find(".add_passenger").click
      page.all(:fillable_field, "pass_name")[1].set("Ikem Okonkwo")
      page.all(:fillable_field, "pass_email")[1].set("kem.okonkwo@andela.com")
      click_button "Save"
      expect(page).to have_content("Booking successfully updated")
    end
  end
end
