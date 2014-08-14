Momo::Application.routes.draw do

  devise_scope :otaku do
    post   '/otakus/bento', to: 'bentos#create', :as => 'login'
    delete '/otakus/bento', to: 'bentos#destroy', :as => 'logout'

    post   '/otakus/password' => 'devise/sessions#create'
    put    '/otakus/password' => 'devise/sessions#update'

    post   '/otakus' => 'devise/registrations#create'
    put    '/otakus' => 'devise/registrations#update'
    delete '/otakus' => 'devise/registrations#destroy'
  end
  devise_for :otaku

  # resources :bentos, only: [:create, :destroy]

  resources :otakus, only: [:index, :show]

  resources :animes, except: [:new, :edit]

  resources :studios, except: [:new, :edit]

  resources :producers, except: [:new, :edit]

  resources :networks, except: [:new, :edit]

  resources :mangas, except: [:new, :edit]

  resources :episodes, except: [:new, :edit]

  resources :people, except: [:new, :edit]

  resources :genres, except: [:new, :edit]

  resources :entities, except: [:new, :edit]

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
