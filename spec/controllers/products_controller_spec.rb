require 'rails_helper'

describe ProductsController, :type => :controller do 

#testig GET methods

	describe 'GET #index' do
		it "responds successfully with an HTTP 200 status code" do
			get :index
			expect(response).to be_success # rails-specific matchers "be_a_new"
			expect(response).to have_http_status(200) # rails-specific matchers "have_http_status"
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("products") #rails-specific matchers "render_template"
		end
	end

describe 'GET #show' do

	before do
		@product = Product.create(:name => "iPhone")    
	end

		it "responds successfully with an HTTP 200 status code" do
			get :show, id: @product.id
			expect(response).to render_template("show")
		end

		it "renders the show template" do
			get :show, id: @product.id
			expect(response).to render_template("show") #rails-specific matchers "render_template"
		end

	end
end

