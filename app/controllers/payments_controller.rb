class PaymentsController < ApplicationController
	respond_to :html, :xml, :json

	def create
	  token = params[:stripeToken]
	  @product = Product.find(params[:product_id])
	  @email = params[:stripeEmail]
  	  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
	    charge = Stripe::Charge.create(
	      :amount => (@product.price * 100).to_i,
	      :currency => "EUR",
	      :source => token,
	      :description => @product.name
	    )

	    @order = Order.create!(product: @product, user: current_user, total: charge.amount)
	    
           # use a Maiiler to send a confirmation email
        UserMailer.send_order_confirmation(@order, @email, @product).deliver

	    redirect_to order_url(@order, notice: 'Your order has been proceeded')
           
	    # redirect_to order_url(order, notice: 'Your order has been procesed')

	  rescue Stripe::CardError => e
	    # The card has been declined
	    body = e.json_body
	    err  = body[:error]
	    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
	  	redirect_to product_path(product)
	  end

  end
end
           
