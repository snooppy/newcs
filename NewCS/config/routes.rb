NewCS::Application.routes.draw do    
 
  match 'department_info' => 'pages#department_info', :via=>[:get]
  
  match 'home' => 'pages#home', :via=>[:get]
  
  #user menu settings
  match 'settings/:id/edit' => 'settings#edit', :via=>[:get], :as => "setting"
  match 'settings/:id/edit' => 'settings#update', :via=>[:put]  
    
  match 'folders/create' => 'folders#create', :via=>[:post]
  match 'folders/:id'    => 'folders#destroy', :via=>[:delete]
  match 'folders/show'    => 'folders#index', :via =>[:get]

  # messages 
  match 'messages/get_new_message' => 'messages#get_new_message', :via=>[:get]
  match 'messages/get_new_dialog/:user_from' => 'messages#get_new_dialog', :via=>[:get]
  match 'messages/get_my_dialog/:user_to' => 'messages#get_my_dialog', :via=>[:get]
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

  #match 'users' => 'users#index', :as => :users  
  #match 'users/new' => 'users#new'  
  #match 'users/create' => 'users#create', :via=>[:post]
  match 'users/sign_in' => 'users#sign_in', :via=>[:get]
  match 'users/sign_out' => 'users#sign_out', :via=>[:get]    
  match 'users/add_user' => 'users#add_user'  
  match 'users/add_user_to_ldap' => 'users#add_user_to_ldap', :via=>[:post]  
  match 'not_validated_users/:id' => 'not_validated_users#register_user', :via=>[:delete], :as => :not_validated_user
  match 'users/register_users' => 'not_validated_users#index', :as => :not_validated_users  
  match 'users/registration' => 'not_validated_users#new'
  match 'not_validated_users/create' => 'not_validated_users#create', :via=>[:post] 
  #match 'users/:id' => 'users#show', :via=>[:get]  
  #  resources :not_validated_users
  
  
  match 'former_users' => 'former_users#index', :as => :former_users

  resources :subjects
  match 'publications/make_valid/:id' => 'publications#make_valid', :via=>[:get]
  match 'publications/for_index' => 'publications#for_index', :via=>[:get]
  match 'publications/:id/edit'     => 'publications#edit', :via=>[:get]
  match 'publications/new'     => 'publications#new', :via=>[:get]
  match 'publications'     => 'publications#index', :via=>[:get]
  match 'publications:page'     => 'publications#index', :via=>[:get], :constraints => { :page => /\d+/ }
  match 'publication/:id' => 'publications#show', :via=>[:get], :constraints => { :id => /\d+/ } #show one
  match 'publications/:todo/:page' => 'publications#index', :via=>[:get], :constraints => { :page => /\d+/ }
  match 'publications/:todo/:cond/:page' => 'publications#index', :via=>[:get], :constraints => { :page => /\d+/ }
 
  resources :publications
  
  resources :groups

  match 'prepods' => 'prepods#index', :via=>[:get]
  match 'prepods/:id/edit' => 'prepods#edit', :via=>[:get], :as => "prepod"
  match 'prepods/:id/edit' => 'prepods#update', :via=>[:put]
  #resources :prepods

  match 'students' => 'students#index', :via=>[:get]
  match 'students/:id/edit' => 'students#edit', :via=>[:get], :as => "student"
  match 'students/:id/edit' => 'students#update', :via=>[:put]  
  #  resources :students
  
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
