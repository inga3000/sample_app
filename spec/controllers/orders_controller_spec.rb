require 'rails_helper'

describe OrdersController, :type => :controller do 

	describe 'GET #index' do
		
		it "should redirect to product page" do
			get :index
			expect(response).to redirect_to(products_url)
		end
	end

end
