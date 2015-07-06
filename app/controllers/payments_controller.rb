class PaymentsController < ApplicationController

	def create

	  token = params[:stripeToken]
	  product = Product.find(params[:product_id])
  	  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
	    charge = Stripe::Charge.create(
	      :amount => product.price,
	      :currency => "EUR",
	      :source => token,
	      :description => product.name
	    )

	    order = Order.create(product: product, user: current_user, total: charge.amount)
	    redirect_to order_url(orders_path, notice: 'Your order has been procesed')

	  rescue Stripe::CardError => e
	    # The card has been declined
	    body = e.json_body
	    err  = body[:error]
	    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
	  end
	  redirect_to product_path(product)
  end
end