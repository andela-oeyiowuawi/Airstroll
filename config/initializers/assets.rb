# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
# Rails.application.config.assets.version = "1.0"
Rails.application.config.assets do
  version = "1.0"
  precompile << /\.(?:svg|eot|woff|ttf)\z/
end
