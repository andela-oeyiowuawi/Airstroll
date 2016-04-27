require File.expand_path("../boot", __FILE__)

require "rails/all"
require "ordinalize_full/integer"
Bundler.require(*Rails.groups)

module Airstroll
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
  end
end
