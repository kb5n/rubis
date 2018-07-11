require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rubis
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :en

    # set to show errors on pages with form_with
    # when you request as ajax, set remote: true
    config.action_view.form_with_generates_remote_forms = false

    # rubocop:disable Metrics/LineLength
    Refile.secret_key = '9de22004a7068316a10854d51e96cf86071e5513f844f2cad92bdc3314eadd538a10cc1f2596c5e4719a888d54f492afd8ffd99906c47c39e2ac85514e120bf2'
    # rubocop:enable Metrics/LineLength

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
