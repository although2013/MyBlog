require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyBlog
  class Application < Rails::Application
    config.assets.initialize_on_precompile = false
    config.i18n.default_locale = 'zh-CN'
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
