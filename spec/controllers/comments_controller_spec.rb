require 'rails_helper'

describe CommentsController, :type => :controller do 

	describe 'POST #create' do

		before do
      @user = User.new email: 'mary@mailinator.com', password: '12345678aA'
			@product = Product.create(:name => "iPhone")   
			@comment = Comment.new(body: "comment 1", user: @user, rating: 2)
			@product.comments << comment
 
		end
		
		it "should redirect to product page" do
			post :create, id:@comment.id, product_id: @product
			expect(response).to redirect_to(@product)
		end
	end

end
