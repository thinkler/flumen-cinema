class Movie < ActiveRecord::Base

  has_many :reviews
  has_many :comments

end
