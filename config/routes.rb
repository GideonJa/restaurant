NyuRest::Application.routes.draw do
 
  get "sessions/show"

  get "sessions/list"

  get "sessions/create"

  # resources :restaurants
  #  resources :reviewers
  

  root :to => "restaurants#list"
  
      get "restaurants/list"
      get "restaurants/new"
      post "restaurants/create"
      get "restaurants/edit/:id",  :controller => :restaurants, :action => :edit
      post "restaurants/update/:id", :controller => :restaurants, :action => :update 
      get "restaurants/sort"
      get "restaurants/show"
      get 'restaurants/search' 
      get "restaurants/delete/:id",  :controller => :restaurants, :action => :delete
      post "restaurants/destroy/:id", :controller => :restaurants, :action => :destroy
      
      
      
      get "reviewers/list"
      get "reviewers/new"
      post "reviewers/create"
      get "reviewers/edit/:id",  :controller => :reviewers, :action => :edit
      post "reviewers/update/:id", :controller => :reviewers, :action => :update 
      get "reviewers/sort/"
      get "reviewers/show"
      get 'reviewers/search' 
      get "reviewers/delete/:id",  :controller => :reviewers, :action => :delete
      post "reviewers/destroy/:id", :controller => :reviewers, :action => :destroy
      
      
      get "reviews/list"
      get "reviews/listall"
      get "reviews/new"
      post "reviews/create"
      get "reviews/edit/:id",  :controller => :reviews, :action => :edit
      post "reviews/update/:id", :controller => :reviews, :action => :update 
      get "reviews/sort"
      get "reviews/show"
      get 'reviews/search/:restaurant_id', :controller => :reviews, :action => :search  
      get 'reviews/search'
      get "reviews/delete/:id",  :controller => :reviews, :action => :delete
      post "reviews/destroy/:id", :controller => :reviews, :action => :destroy
    
   
  
  
  
 

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
