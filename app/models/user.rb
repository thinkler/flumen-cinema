class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, dependent: :destroy

  has_many :article_ratings, dependent: :destroy
  has_many :review_ratings, dependent: :destroy
  has_many :movie_ratings, dependent: :destroy

end
