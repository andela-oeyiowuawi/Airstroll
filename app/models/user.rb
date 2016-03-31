class User < ActiveRecord::Base

  def from_omniauth(auth)
  where(provider: auth.provider, user_code: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    user.user_code = auth.uid
    user.email = auth.info.email
    user.name = auth.info.name
    user.save
  end
end
