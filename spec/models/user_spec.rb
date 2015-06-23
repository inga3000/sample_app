require "rails_helper"

  describe User do

  	describe '#password_complexity' do

  		context 'when no uppercase letter' do
  		  before do
  		  	  @user = User.new email: "user@example.com", 
  					password: "artemis1688"
  			end

  			it 'should not be valid ' do
  				expect(@user.save).to be_falsey
  			end
  		end
  	end

  	context 'when is too short' do
  		before do
  		  	@user = User.new email: "user@example.com", 
  				password: "abc"
  		end

  		it 'should not be valid ' do
  			expect(@user.save).to be_falsey
  		end
  	end

  	context 'when password confirmation does not match' do
  		before do
  		  @user = User.new email: "user@example.com", 
  			password: "CareerFoundry1", password_confirmation: "CareerFoundry2"
  	end

  	it 'should not be valid ' do
  		expect(@user.save).to be_falsey
  	end
  end
  		
end

