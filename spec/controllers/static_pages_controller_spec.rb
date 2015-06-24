require 'rails_helper'

describe StaticPagesController, :type => :controller do 

#testig GET methods

  describe 'GET #index' do
  	it "responds successfully with an HTTP 200 status code" do
  		get :index
  		expect(response).to be_success # rails-specific matchers "be_a_new"
  		expect(response).to have_http_status(200) # rails-specific matchers "have_http_status"
  	end

  	it "renders the index template" do
  	  get :index
  	  expect(response).to render_template("index") #rails-specific matchers "render_template"
  	end
  end

 describe 'GET #landing_page' do
  	it "responds successfully with an HTTP 200 status code" do
  		get :landing_page
  		expect(response).to be_success # rails-specific matchers "be_a_new"
  		expect(response).to have_http_status(200) # rails-specific matchers "have_http_status"
  	end

  	it "renders the landing page template" do
  	  get :landing_page
  	  expect(response).to render_template("landing_page") #rails-specific matchers "render_template"
  	end
  end

 describe 'GET #contact' do
  	it "responds successfully with an HTTP 200 status code" do
  		get :contact
  		expect(response).to be_success # rails-specific matchers "be_a_new"
  		expect(response).to have_http_status(200) # rails-specific matchers "have_http_status"
  	end

  	it "renders the contact page template" do
  	  get :contact
  	  expect(response).to render_template("contact") #rails-specific matchers "render_template"
  	end
  end
end