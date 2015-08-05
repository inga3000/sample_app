class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments
  has_attached_file :photo
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  
  validates :name, presence: true

  def average_rating
    comments.average(:rating).to_f 
  end
end
