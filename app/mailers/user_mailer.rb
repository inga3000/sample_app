class UserMailer < ActionMailer::Base
  default from: "inga.wiegand@gmail.com'"

  def contact_form(email, name, message)
    @email = email
    @name = name
    @message = message
    mail(from: email, to: 'inga.wiegand@gmail.com', 
      subject: "A new contact form message from #{@name}")
  end

  # Email for visitors 
  def contact_confirmation(email, name, message)
    @email = email
    @name = name
    @message = message
    mail(to: email, subject: "We have received your message")
  end 

end