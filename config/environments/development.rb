Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  
  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Logging level
  config.log_level = :warn

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  config.action_mailer.smtp_settings = {
    address: "smtp.sendgrid.net",
    port: 2525,
    domain: Rails.application.secrets.domain_name,
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: Rails.application.secrets.email_provider_username,
    password: Rails.application.secrets.email_provider_password
  }
  # ActionMailer Config
  # config.action_mailer.default_url_options = { :host => 'mos.letsapp.ddns.me' }
  config.action_mailer.default_url_options = { :host => 'https://sw.letsapp.biz' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.raise_delivery_errors = true
  # Send email in development mode?
  config.action_mailer.perform_deliveries = true
  #config.action_mailer.perform_deliveries = false


  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  
  # Paper Clip configuration
  # Paperclip.options[:command_path] = "/usr/local/bin/"
  # for ubuntu
  # Paperclip.options[:command_path] = "/usr/bin/"
  GA.tracker = "UA-118278120-1"

  # for enforcing SSL on various user areas
  #config.to_prepare { Devise::SessionsController.force_ssl }
  #config.to_prepare { Devise::RegistrationsController.force_ssl }
  #config.to_prepare { Devise::PasswordsController.force_ssl }

end
