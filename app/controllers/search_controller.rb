class SearchController < ApplicationController

	add_breadcrumb "Home", :root_path

	def search
		@articles = Article.ransack(title_cont: params[:search]).result
		@actors = Actor.ransack(name_cont: params[:search]).result
		@reviews = Review.ransack(title_cont: params[:search]).result
		@movies = Movie.ransack(name_cont: params[:search]).result
		add_breadcrumb "Search result"
	end
		
end
