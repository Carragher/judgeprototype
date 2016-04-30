Rails.application.routes.draw do

  resources :users
  resources :sessions
  root :to => "sessions#login"
  match "signup", :to => "users#new", via: [:get, :post]
  match "login", :to => "sessions#login", via: [:get, :post]
  match "logout", :to => "sessions#logout", via: [:get, :post]
  match "home", :to => "sessions#home", via: [:get, :post]
  match "profile", :to => "sessions#profile", via: [:get, :post]
  match "setting", :to => "sessions#setting", via: [:get, :post]
  match "login_attempt", :to => "sessions#login_attempt", via: [:get, :post]
  match "create_prob", :to => "sessions#create_prob", via: [:get, :post]
  match "create_subl", :to => "sessions#create_subl", via: [:get, :post]
  match "judge", :to => "sessions#judge", via: [:get,:post]
  match "poke_jenkins", :to => "sessions#poke_jenkins", via: [:get,:post]
  match "admin", :to => "sessions#admin", via: [:get, :post]
  match "" , :to => "sessions#home", via: [:get, :post]
 # get 'sessions/home,'

  #get 'sessions/profile,'

 # get 'sessions/setting'

 # root 'users#new'
 # resources :test

  #match ':controller(/:action(/:id(.:format)))' , :via => [:post]
  #post '/users/create'





  #match "signup", :to => "users#new"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
