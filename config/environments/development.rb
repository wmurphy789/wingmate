Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false

  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load


  config.assets.debug = false
  config.assets.raise_runtime_errors = true
  config.action_controller.asset_host = 'localhost:3000'
  config.action_mailer.asset_host = 'http://localhost:3000'

  config.after_initialize do
    ActionMailer::Base.default_url_options = {host: APP_CONFIG['smtp_default_host']}
    ActionMailer::Base.delivery_method = :letter_opener
  end

end
