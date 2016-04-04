
class User < ActiveRecord::Base
  has_many :bookings

  def self.from_omniauth(auth)
    where(provider: auth.provider, user_code: auth.uid).first_or_create do |usr|
      usr.provider = auth.provider
      usr.user_code = auth.uid
      usr.email = auth.info.email
      usr.name = auth.info.name
      usr.save
    end
  end
end
