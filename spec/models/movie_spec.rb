require 'spec_helper'

describe Movie do

	it "calculate total ball" do

		review1 = Review.new(total_ball: 10)
		review2 = Review.new(total_ball: 6)

		movie = Movie.new(total_ball: 3)
		movie.reviews << review1
		movie.reviews << review2

		expect(movie.calculate_ball).to eq(8)
	end


end
