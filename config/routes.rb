Policycompass::Application.routes.draw do

  root to: 'static_pages#index'

  get "static_pages/prelaunch"

  get "static_pages/onboard_questions"

  get "static_pages/dashboard"

  get "static_pages/feed"

  
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup', to: 'users#new'
  match '/knight_challenge', to: 'static_pages#knight_challenge'
  match '/about', to: 'static_pages#knight_challenge'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete, :as => :signout

  resources :users do
    resources :orgs do
      member do 
        get 'dashboard'
      end
      resources :policies do
      resources :questions
      end
    end

    resources :voters do 
      member do 
        get 'feed'
        get 'dashboard'
      end
      resources :voter_answers
    end

    resources :candidates do
      member do 
        get 'feed'
        get 'dashboard'
      end
      resources :candidate_answers
    end
  end


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
