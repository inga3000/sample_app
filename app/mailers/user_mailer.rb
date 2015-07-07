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

  def send_order_confirmation(email, order, product)
    @email = email
    @product = product
    mail(to: @email, subject: "Order Confirmation from 'It's a Store'")
  end  
end