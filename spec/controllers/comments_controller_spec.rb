require 'rails_helper'

describe CommentsController, :type => :controller do 

	describe '#create' do

    context 'given a user and a product' do
			before do
				@user = User.new email: 'mary@mailinator.com', password: '12345678aA'
				@user.save!

				@product = Product.create!(:name => "iPhone")
			end

			it "creates new comment attached to product" do
        expect do
          expect do
						# fire
						post :create, comment: {user_id: @user.id, body: "comment 1", rating: 2}, product_id: @product.id
          end.to change { @product.reload.comments.count }.by(1)
        end.to change { Comment.count }.by(1)

				# check result
				expect(response).to redirect_to(@product)
			end
    end
	end

end
