class Movie < ActiveRecord::Base

  has_many :reviews
  has_many :comments
  has_and_belongs_to_many :actors

end
