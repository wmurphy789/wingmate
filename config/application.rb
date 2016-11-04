require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WingmateRails
  class Application < Rails::Application

    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths += %W(#{config.root}/lib)
    
    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*',
          headers: :any,
          expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
          methods: [:get, :post, :options, :delete, :put]
      end
    end   

    config.to_prepare do
        Devise::Mailer.layout "mailer" 
    end 
  end
end
