class Actor < ActiveRecord::Base

  has_and_belongs_to_many :movies, -> { uniq }, dependent: :destroy

  validates :name, :age, :photo_url, presence: true

end
