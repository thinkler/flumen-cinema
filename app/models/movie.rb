class Movie < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :actors, -> { uniq }, dependent: :destroy

  validates :name, :genre, :box_office, :desc, :poster_url, presence: true

  def calculate_ball

	  	r_count = 0
	  	reviews.map {|r| r_count+=1 } 
		total_ball = reviews.map(&:total_ball).inject(:+) 
			
		if total_ball	
			total_ball = total_ball / r_count
		end
			
  end

end
