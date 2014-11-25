class ContactMailer < ActionMailer::Base
  default from: ENV['MAILER_USER_NAME']
  
  def notice_email(contact)
    @contact = contact
    mail(to: ENV['EMAIL'], subject: '[Qiang Apps]New contact is coming!!!')
  end
end
