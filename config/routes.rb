Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  root 'articles#main'

  resources :articles
  resources :movies
  resources :actors
  resources :reviews
  resources :comments

  post 'actors/:id' => 'actors#add_movie', as: :add_movie

  delete 'actors/delete_movie/:id' => 'actors#delete_movie', as: :delete_movie

  post 'movies/:id' => 'movies#add_actor'

  delete 'movies/delete_actor/:id' => 'movies#delete_actor', as: :delete_actor

  post 'articles/up_vote/:id' => 'articles#up_vote'
  post 'articles/down_vote/:id' => 'articles#down_vote'

  post 'movies/up_vote/:id' => 'movies#up_vote'
  post 'movies/down_vote/:id' => 'movies#down_vote'

  post 'reviews/up_vote' => 'reviews#up_vote'
  post 'reviews/down_vote' => 'reviews#down_vote'

  get 'search' => 'search#search', as: :search

  get 'search_movie_list' => 'actors#movie_select_list', as: :movie_search_list
  get 'search_actor_list' => 'movies#actor_select_list', as: :actor_search_list

  get 'movie_list/:id' => 'actors#movie_list', as: :movie_list
  get 'actor_list/:id' => 'movies#actor_list', as: :actor_list
  get 'review_list/:id' => 'movies#review_list', as: :review_list
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
