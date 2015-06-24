class Article < ActiveRecord::Base

  has_many :comments, dependent: :destroy

  validates :title, :body, :img_url, presence: true

end
