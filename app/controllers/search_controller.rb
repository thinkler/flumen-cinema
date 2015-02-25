class SearchController < ApplicationController

	add_breadcrumb "Home", :root_path

	def search
		@articles = Article.limit(20).ransack(title_cont: params[:search]).result
		@actors = Actor.limit(20).ransack(name_cont: params[:search]).result
		@reviews = Review.limit(20).ransack(title_cont: params[:search]).result
		@movies = Movie.limit(20).ransack(name_cont: params[:search]).result
		add_breadcrumb "Search result"
	end
		
end
