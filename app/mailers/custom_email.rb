class CustomEmail < ApplicationMailer
  default :from     => APP_CONFIG['smtp_default_from'],
          :reply_to => APP_CONFIG['smtp_default_from']
  

  def send_email(from, to, subject, body, type=1)
    reply_to = from
    from = APP_CONFIG['smtp_default_from']


    @body = body.html_safe
    @type = type


    mail(from: from, to: to, subject: subject, reply_to: reply_to)
  end
end
