require 'rails_helper'

describe Product do
  describe '#name' do
    context 'when is missing' do
      before do
        expect(subject.name).to be_blank
      end  

      it 'should be invalid without a name' do
        # fire
        subject.valid?

        # check that the test gives the result that we want
        expect(subject.errors[:name]).to include("can't be blank")
      end
    end

    context 'when is present' do 
      before do 

        subject.name = "Apple iPhone 6"

        expect(subject.name).to be_present
      end

      it 'should be valid with a name' do
        # fire
        subject.valid?

        # check that the test gives the result that we want
        expect(subject.errors[:name]).to be_blank
      end
    end 

  end

  describe '#average_rating' do
    context 'when we have comments with rating' do
      before do
        # test setup. I am preparing the context of the actual test
        user = create(:user)
        @product = create(:product_with_comments)
        # @product.comments << Comment.new(5.times { FactoryGirl.build(:comment, user)}) 
      end  

      it 'should give the correct average' do
        # fire
        result = subject.average_rating

        # check that the test gives the result that we want
        expect(result).to eq(3)

        # ALTERNATIVE: fire test and check result at the same time. This is an alternative which is usually used:
        #
        # expect(subject.average_rating).to eq(3)
      end 
    end  
    
  end

  # optionally
  describe '#orders' do
    it 'should respond to orders' do
      expect(subject).to respond_to(:orders)
    end  
  end 

  describe '#comments' do
    it 'should respond to comments' do
      expect(subject).to respond_to(:comments)
    end  
  end   
end