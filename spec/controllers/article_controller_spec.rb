require 'spec_helper'

describe ArticlesController do

	describe 'show action' do 

		it 'renders show template if an article is found' do
			article = Article.create(title: "lol")
			get :show, { id: article.id }
			response.should render_template('show')
		end

		it 'render 404 if page not found' do
			get :show, {id: 0}
			response.should render_template('error_404')
		end

	end

	describe 'create action' do 

		it 'render root path if article created' do
			post :create, article: { title: 'Title'}
			response.should redirect_to root_path
		end 

		it 'render root path if validation failed' do
			post :create, article: {title: ""}
			response.should render_template('new')
		end 

		it 'up article rating' do
			a = Article.create(title: 'new')
			post :up_vote, id: 1

			expect(a.rating).to eq(1)
		end

		it 'down article rating' do
			a = Article.create(title: 'new')
			post :down_vote, id: 1

			expect(a.rating).to eq(-1)
		end
	
	end

	describe 'destroy action' do

		it 'redirect to root url' do 
			article = Article.create(title: "1")
			delete :destroy, id: article.id
			response.should redirect_to(root_path)
		end

	end

end

