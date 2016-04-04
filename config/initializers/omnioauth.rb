Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'],
           scope: 'public_profile, email', info_fields: 'id, name, link, email'
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET'],
           scope: 'email, profile, plus.me, http://gdata.youtube.com',
           prompt: 'select_account',
           image_aspect_ratio: 'square',
           image_size: 50
end
