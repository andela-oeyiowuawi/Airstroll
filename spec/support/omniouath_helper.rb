
require "spec_helper"
OmniAuth.config.test_mode = true

def set_valid_omniauth
  OmniAuth.config.add_mock(:facebook, mock_fb_oauth_response)
end

def set_invalid_omniauth
  OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
end

def mock_fb_oauth_response
  OmniAuth::AuthHash.new(
    provider: "facebook",
    uid: "1234567",
    info: {
      email: "olalekan.eyiowuawi@andela.com",
      name: "Example User",
      first_name: "user",
      last_name: "example",
      image: "http://graph.facebook.com/1234567/picture?type=square",
      urls: { Facebook: "http://www.facebook.com/umock" },
      location: "Yaba Lagos",
      verified: true },
    credentials: {
      token: "SYQ3KB27P2...",
      expires_at: 3_451_747_305,
      expires: true
    },
    extra: {
      raw_info: {
        id: "1234567",
        name: "Example User",
        first_name: "user",
        last_name: "example",
        link: "http://www.facebook.com/umock",
        username: "umocks",
        location: { id: "123456789", name: "Yaba Lagos" },
        gender: "male",
        email: "lecqon@airstroll.com",
        timezone: 0,
        locale: "en_Uk",
        verified: true,
        updated_time: "2011-11-11T06:21:03+0000"
      }
    }
  )
end
