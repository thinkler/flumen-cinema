class Movie < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :actors, -> { uniq }, dependent: :destroy

end
