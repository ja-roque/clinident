require_relative 'boot'

require 'rails/all'
require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Clinident
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.action_mailer.smtp_settings = {
        address: "smtp.gmail.com",
        port: 587,
        domain: "clinident.com",
        authentication: "plain",
        enable_starttls_auto: true,
        user_name: ENV["GMAIL_USERNAME"],
        password:ENV["GMAIL_PASSWORD"]
    }
    config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  end
end
