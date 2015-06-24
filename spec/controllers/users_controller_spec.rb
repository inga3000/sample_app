require 'rails_helper'

describe UsersController, :type => :controller do
  
  describe "GET #index" do
    before do
      @user = User.create(:email => 'inga@abc.com', :password => 'Qwerty1234')
      sign_in @user 
    end
    
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200) 
    end
 
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "renders the new user template" do
      get :new
      expect(response).to render_template("new")
    end

    it "renders the show user template" do
      get :show, id: @user.id
      expect(response).to render_template("show")
    end

  end
end