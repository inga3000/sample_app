require "rails_helper"

	describe User do

		describe '#password_complexity' do

			context 'when no uppercase letter' do
				before do
					subject.email = "user@example.com"
					subject.password = "qwerty1234"
				end

				it 'should not be valid ' do
					expect(subject.errors[:password]).to include( )
				end
			end

			context 'when is too short' do
				before do
					subject.email = "user@example.com"
					subject.password ="abc"
				end

				it 'should not be valid ' do
					expect(subject.errors[:password]).to include( )
				end
			end

			context 'when password confirmation does not match' do
				before do
					subject.email = "user@example.com", 
					subject.password ="CareerFoundry1"
					subject.password_confirmation = "CareerFoundry2"
				end

				it 'should not be valid ' do
					expect(subject.errors[:password]).to include( )
				end 
			end

		end
	end


