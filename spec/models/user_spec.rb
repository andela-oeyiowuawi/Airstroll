require "rails_helper"
RSpec.describe User, type: :model do
  subject(:user) { User.new(provider: provider, user_code: user_id, name: name, email: email) }
  let(:provider) {"google"}
  let(:user_id) {"2weq134erddwe333"}
  let(:name) {"Olalekan"}
  let(:email) {"Olalekan@gmail.com"}

  describe ".from_omniauth"  do
    it {is_expected.to be_valid}
  end

  describe ".from_omniauth" do
    it "saves new user" do
      expect(User::from_omniauth(set_valid_omniauth)).to be_a User
      end
  end

end
