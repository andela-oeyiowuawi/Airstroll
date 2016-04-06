require "rails_helper"
RSpec.describe User, type: :model do
  user = User.new
  before(:all) do
    user.provider = "google"
    user.user_code = "2weq134erddwe333"
    user.name = "Olalekan"
    user.email = "Olalekan@gmail.com"
  end
  describe ".from_omniauth" do
    it { is_expected.to be_valid }
  end

  describe ".from_omniauth" do
    it "saves new user" do
      expect(User.from_omniauth(set_valid_omniauth)).to be_a User
    end
  end
end
