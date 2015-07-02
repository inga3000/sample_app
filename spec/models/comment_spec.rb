require 'rails_helper'


describe Comment do

	describe '#body' do
		context 'when is missing' do
			before do
        # In the before block here, I am making sure that the context is correct
				expect(subject.body).to be_blank
			end

			it 'should be invalid' do
        # fire the test
        subject.valid?

        # check that the test gives the result that we want
				expect(subject.errors[:body]).to include("can't be blank")
			end
		end

		context "when is present" do
      before do
      	@comment = build(:comment)
      end

      it "should return the comments body" do
      	expect(@comment.body).to eq "I like it."
      end
    end

  end

	describe '#user' do
		context 'when is missing' do

			before do
				expect(subject.user).to be_blank
			end

			it 'should be invalid' do
        # fire
        subject.valid?

				# check that the test gives the result that we want
				expect(subject.errors[:user]).to include("can't be blank")
			end

		end
	end

	describe '#product' do
		context 'when is missing' do

			before do
				expect(subject.product).to be_blank
			end

			it 'should be invalid' do
        # fire
        subject.valid?

        # check that the test gives the result that we want
				expect(subject.errors[:product]).to include("can't be blank")
			end

		end
	end

	describe '#rating' do
		context 'when is no integer' do

			before do
				@comment = build(:comment, rating: "d")
				expect(@comment.rating).to_not match(/\d+/)
			end

			it 'should be invalid' do
        # fire
        @comment.valid?

        # check that the test gives the result that we want
				expect(@comment.errors[:rating]).to include("is not a number")
			end
    end

    context 'when is missing' do
      before do
        expect(subject.rating).to be_blank
      end

      it 'should be invalid' do
        # fire
        subject.valid?

				# check that the test gives the result that we want
        expect(subject.errors[:rating]).to include("is not a number")
      end
    end
	end

end
