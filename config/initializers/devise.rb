Devise.setup do |config|
  config.secret_key = 'b224ffda2d06afc84dac60fae20382aaee496e71da554063bc1780895780027bce61248a3234ae2aab24358fb2e123b68c8ecff3b966e511e1c365ef1eb91709'
  if Rails.env.production?
    config.mailer_sender = 'ShareProz <autopilot@shareproz.com>'
  else
    config.mailer_sender = 'ShareProz <email@sparknet.me>'
  end

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = false

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..72

  config.reset_password_within = 6.hours

  config.sign_out_via = [:get, :delete]

  config.authentication_keys = [:email]

  config.email_regexp = /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/

end
