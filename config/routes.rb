Rails.application.routes.draw do
  get 'categories/new'

  get 'welcome/index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'items#index'

  get '/categories(/:value)/items' => "items#categories"

  get "categories/new" => "categories#new", as: :new_category
  post "categories" => "categories#create"
  get "categories" => 'categories#index'
  get "categories/:id/edit" => "categories#edit", as: :edit_category
  patch "categories/:id" => "categories#update"
  get "categories/:id" => "categories#show"
  get 'categories/:id' => 'categories#show', as: :category
  delete 'categories/:id' => 'categories#destroy', as: :destroy_category
  
  get '/sign_up' => 'users#new', as: :sign_up
  post '/users' => 'users#create'

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  resources :items

  delete 'items/:id' => 'items#destroy', as: :destroy_item

  get '/current_cart/' => 'carts#show', as: :current_cart
  get '/add_to_cart/:item_id' => 'carts#add_to_cart', as: :add_to_cart
  get '/remove_from_cart/:item_id' => 'carts#remove_from_cart', as: :remove_from_cart
  get '/remove_all_from_cart/:item_id' => 'carts#remove_all_from_cart', as: :remove_all_from_cart
  

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
