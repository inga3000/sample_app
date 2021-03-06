require "rails_helper"

	describe User do

		describe '#password_complexity' do

			context 'when no uppercase letter' do
				before do
					@user = build(:user, password: "hallihallo123")
          expect(@user.password).to_not match(/[A-Z]/)
				end

				it 'should not be valid ' do
          # fire
          @user.valid?

					# check that the test gives the result that we want
					expect(@user.errors[:password]).to include("must include at least one lowercase letter, one uppercase letter, and one digit")
				end
			end

			context 'when it has length less than 8' do
				before do
					@user = build(:user, password: "123aA")
          expect(@user.password.length).to be < 8
				end

				it 'should not be valid ' do
          # fire
          @user.valid?

          # check that the test gives the result that we want
					expect(@user.errors[:password]).to include("is too short (minimum is 8 characters)")
				end
			end

			context 'when password confirmation does not match' do
				before do
					@user = build(:user, email: "foo@mailinator.com", password: "CareerFoundry1", password_confirmation: "CareerFoundry2")

          expect(@user.password).to_not eq(@user.password_confirmation)
				end

				it 'should not be valid ' do
          # fire
          expect do
            begin
              @user.save!
            rescue Exception => ex
              expect(ex.message).to include("Validation failed: Password confirmation doesn't match Password")
              raise
            end
          end.to raise_error(ActiveRecord::RecordInvalid)
				end
			end

		end
	end

