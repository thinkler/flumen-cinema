class Review < ActiveRecord::Base

  belongs_to :movie
  belongs_to :user
  has_many :comments
  
end
