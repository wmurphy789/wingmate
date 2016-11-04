class ApplicationMailer < ActionMailer::Base
  default from: APP_CONFIG['smtp_default_from']
  layout 'mailer'
end
