TheNoows::Application.routes.draw do
  #get "homepage/home"
  #get "homepage/new"
  #get "homepage/category"

  match '/' => 'homepage#home', :as => 'homepage'
  match '/new/' => 'homepage#new', :as => 'new'
  match 'news_items/:id/vote_up' => 'news_item#vote_up', :as => 'vote_up_news_item'
  match '/logout' => 'user_session#destroy', :as => 'logout'

  resource :oauth, :only => [:new], :controller => 'oauth' do
    get 'callback', :on => :collection
  end

  #match 'oauth/start' => 'oauth#start', :as => 'oauth_authorize'
  #match 'oauth/callback' => 'oauth#callback', :as => 'oauth_callback'

  resources :source_categories do
    resources :sources do
      resources :news_items
    end
  end

#  get "news_item/list"
#  get "news_item/vote_up"

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

