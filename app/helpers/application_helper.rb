module ApplicationHelper

	def currency(price)
	  number_to_currency(price, :unit => "€")
	end

end
