class StaticPagesController < ApplicationController

  def index
  end

  def landing_page
    @featured_product = Product.first
    @products = Product.limit(3)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]

    # We want to send that message
    # together with name and email to
    # the owner of the site
    #ActionMailer::Base.mail(:from => @email, 
    #	                    :to => 'inga.wiegand@gmail.com', 
    #	                    :subject => "A new contact form message from #{@name}", 
    #	                    :body => @message).deliver
    UserMailer.contact_form(@email, @name, @message).deliver

    # We want to send a confirmation email back to site visitor/guest
    UserMailer.contact_confirmation(@email, @name, @message).deliver
    #UserMailer.mail(:from => @email, 
	#  	:to => 'inga.wiegand@gmail.com', 
	#  	:subject => "A new contact form message from #{@name}", 
	#  	:body => @message).deliver
  end

end
