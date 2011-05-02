Devolve::Application.routes.draw do
  get "mailbox/show"
 get "mailbox/trash"
  get "messages/show"
get "messages/destroy"
get "messages/undelete"
get "messages/delete_from_trash"
  get "sent/index"

  get "sent/show"

  get "sent/new"
  get "sent/delete"
  
  get "sent/new_reply"
  get "messages/forward"

    resources :events
  get "search/index"

  get "codes/index"

  get "calendar/index"
get 'users/invitation'

get 'events/new'
  get "codes/create"
  
  get "codes/save"

  get "bookmarks/index"

  get "bookmarks/create"
  get "bookmarks/saved"
  
  get "bookmarks/notsaved"
  get "messages/reply"
 match 'mailbox/inbox' => 'mailbox#index'
  resources :microposts, :only => [:create, :destroy]
  resources :bookmarks,:only=>[:create,:destroy]
  
  resources :codes,:only=>[:create,:destroy]
  get "profiles/show"


  get "profiles/edit"
  get "microposts/destroy"
  get "bookmarks/destroy"
  
 get "home/gettingstarted"
  get "profile/show"
  match 'home/create' => 'home#create'
  
  match 'profiles/create' => 'profiles#create'
  
  match 'friendship/create' => 'friendship#create'
  
  match 'friendship/accept' => 'friendship#accept'
  
  match 'friendship/decline' => 'friendship#decline'
  
  match 'friendship/cancel' => 'friendship#cancel'

match 'microposts'=>'microposts/create'
match 'microposts/destroy'=>'microposts#destroy'

match 'bookmarks/destroy'=>'bookmarks#destroy'
match 'codes/destroy'=>'codes#destroy'
  resources :profiles,:sent,:messages,:mailbox,:member =>{ :reply => :get,:forward => :get, :undelete => :put  },:collection => { :trash => :get }
 

 get "home/getting_started_completed"
  devise_for :users
  get "home/index"
  get "home/create"
  match 'bookmarks/save' => 'bookmarks#save'
  
  match 'codes/save' => 'codes#save'
  get "home/help"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  match 'profiles/:id' => 'profile#show'
  match 'bookmarks/:id' => 'bookmarks#index'
  
  match 'codes/:id' => 'codes#index'
    match 'codes/:id1/:id' => 'codes#view'
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
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
    
end
