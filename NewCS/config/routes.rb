NewCS::Application.routes.draw do    
 
  match 'home' => 'pages#prepod_home', :via=>[:get]
  
  #user menu settings
  match 'settings/:id/edit' => 'settings#edit', :via=>[:get], :as => "setting"
  match 'settings/:id/edit' => 'settings#update', :via=>[:put]  
    
  match 'folders/create' => 'folders#create', :via=>[:post]
  match 'folders/:id'    => 'folders#destroy', :via=>[:delete]
  match 'folders/show'    => 'folders#index', :via =>[:get]

  # messages 
  match 'messages/get_new_message' => 'messages#get_new_message', :via=>[:get]
  match 'messages/get_new_dialog/:user_from' => 'messages#get_new_dialog', :via=>[:get]
  match 'messages/read/:id' => 'messages#read', :via=>[:get]  
  match 'messages/dialog/:id' => 'messages#dialog', :via=>[:get], :as=>"dialog"
  match 'messages/dialogs' => 'messages#dialogs', :via=>[:get]
  match 'messages/create' => 'messages#create', :via=>[:post]
  match 'messages/users_list/:text' => 'messages#users_list', :via=>[:get]
  match 'messages' => 'messages#new', :as => :messages
  
  
  # events
  match 'events/scan/:events' => 'events#scan', :via=>[:get] 
  match 'events/scan/' => 'events#scan', :via=>[:get] 
  
  match 'documents/create' => 'documents#create', :via=>[:post]
  match 'documents/new' => 'documents#new', :via=>[:get]
  match 'documents/:user_id/*folder' => 'documents#index', :via=>[:get]
  match 'documents/:user_id/' => 'documents#index', :via=>[:get]
  match 'documents' => 'documents#index', :via=>[:get]
  match 'documents/:id'    => 'documents#destroy', :via=>[:delete]

  resources :publications_types
  
  match 'shedules/get_one_shedule_form/:day/:hour/(:groups_id)' => 'shedules#get_one_shedule_form', :via=>[:get]
  resources :shedules

  resources :publication_cats

  resources :publication_types

  match 'users' => 'users#index', :as => :users
  match 'users/new' => 'users#new'
  match 'users/create' => 'users#create', :via=>[:post]
  match 'users/sign_in' => 'users#sign_in', :via=>[:get]
  match 'users/sign_out' => 'users#sign_out', :via=>[:get]  
  
  match 'former_users' => 'former_users#index', :as => :former_users

  resources :subjects

  match 'publications/for_index' => 'publications#for_index', :via=>[:get]
  match 'publications/:id/edit'     => 'publications#edit', :via=>[:get]
  match 'publications/new'     => 'publications#new', :via=>[:get]
  match 'publications'     => 'publications#index', :via=>[:get]
  match 'publications/:page'     => 'publications#index', :via=>[:get], :constraints => { :page => /\d+/ }
  match 'publication/:id' => 'publications#show', :via=>[:get], :constraints => { :id => /\d+/ } #show one
  match 'publications/:todo/:page' => 'publications#index', :via=>[:get], :constraints => { :page => /\d+/ }
  match 'publications/:todo/:cond/:page' => 'publications#index', :via=>[:get], :constraints => { :page => /\d+/ }
 
  resources :publications
  
  resources :groups

  resources :prepods

  resources :students
  
  resources :pages

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
  root :to => 'index#index'
  match '403.html' => 'pages#forbiden'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
