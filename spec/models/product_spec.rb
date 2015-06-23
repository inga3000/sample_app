require 'rails_helper'

describe Product do
  describe '#name' do
    context 'when is missing' do
      before do
        subject.valid?
      end  

      it 'should be invalid without a name' do
        expect(subject.errors[:name]).to include("can't be blank")
      end
    end

    context 'when is present' do 
      before do 
        subject.name = "Apple iPhone 6"
        subject.valid?
      end

      it 'should be valid with a name' do
        expect(subject.errors[:name]).to be_blank
      end
    end 

  end

  describe '#average_rating' do
    context 'when we have comments with rating' do
      before do
        # test setup. I am preparing the context of the actual test
        user = User.new email: 'mary@mailinator.com', password: '12345678aA'
        user.save!

        subject.name = 'Apple iPhone'
        subject.comments << Comment.new(body: "coment 1", user: user, rating: 2)
        subject.comments << Comment.new(body: "coment 1", user: user, rating: 5)
        subject.comments << Comment.new(body: "coment 1", user: user, rating: 3)
        subject.comments << Comment.new(body: "coment 1", user: user, rating: 4)
        subject.comments << Comment.new(body: "coment 1", user: user, rating: 1)      
        subject.save!
      end  

      it 'should give the correct average' do
        # fire test, call the actual test
        expect(subject.average_rating).to eq(3)
      end 
    end  
    
  end

  describe '.add_two_numbers' do

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