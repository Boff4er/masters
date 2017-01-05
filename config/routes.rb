Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }

  resources :users, :only => [:index, :destroy]
  #mount RuCaptcha::Engine => "/rucaptcha"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  get '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  get '/admin' => 'admin#index'

  get '/admin/cats' => 'cats#index', :ident => "cats"
  get '/admin/cats/new' => 'cats#new', :ident => "cats"
  get '/admin/cats/form' => 'cats#form', :ident => "cats"
  get '/admin/cats/edit/:id' => 'cats#edit', :ident => "cats"
  get '/admin/cats/delete/:id' => 'cats#delete', :ident => "cats"

  get '/admin/products' => 'products#index', :ident => "products"
  get '/admin/products/new' => 'products#new', :ident => "products"
  post '/admin/products/form' => 'products#form', :ident => "products"
  get '/admin/products/edit/:id' => 'products#edit', :ident => "products"
  get '/admin/products/delete/:id' => 'products#delete', :ident => "products"

  get '/admin/news' => 'news#index', :ident => "news"
  get '/admin/news/new' => 'news#new', :ident => "news"
  post '/admin/news/form' => 'news#form', :ident => "news"
  get '/admin/news/edit/:id' => 'news#edit', :ident => "news"
  get '/admin/news/delete/:id' => 'news#delete', :ident => "news"

  get '/admin/articles' => 'article#index', :ident => "article"
  get '/admin/articles/new' => 'article#new', :ident => "article"
  post '/admin/articles/form' => 'article#form', :ident => "article"
  get '/admin/articles/edit/:id' => 'article#edit', :ident => "article"
  get '/admin/articles/delete/:id' => 'article#delete', :ident => "article"

  get '/admin/experts' => 'expert#index', :ident => "expert"
  get '/admin/experts/new' => 'expert#new', :ident => "expert"
  post '/admin/experts/form' => 'expert#form', :ident => "expert"
  get '/admin/experts/edit/:id' => 'expert#edit', :ident => "expert"
  get '/admin/experts/delete/:id' => 'expert#delete', :ident => "expert"

  get '/admin/analitics' => 'analitic#index', :ident => "analitic"
  get '/admin/analitics/new' => 'analitic#new', :ident => "analitic"
  post '/admin/analitics/form' => 'analitic#form', :ident => "analitic"
  get '/admin/analitics/edit/:id' => 'analitic#edit', :ident => "analitic"
  get '/admin/analitics/delete/:id' => 'analitic#delete', :ident => "analitic"

  get '/news' => 'home#news_index'
  get '/news/:id' => 'home#news_get'

  get '/create' => 'home#create'
  get '/tasks' => 'task#index'
  get '/tasks/:id' => 'task#get'
  get '/tasks/:id/edit' => 'task#edit'
  post '/set_order' => 'task#set_order'
  post '/task_delete' => 'task#task_delete'
  post '/task_archive' => 'task#task_archive'
  post '/delete_order' => 'task#delete_order'
  post '/change_order' => 'task#change_order'
  post '/change_task' => 'task#change_task'
  post '/edit_order' => 'task#edit_order'

  get '/profile/main_page' => 'profile#main_page'
  get '/profile' => 'profile#index'
  #get '/profile/master' => 'profile#master'
  #get '/profile/master/answer' => 'profile#master_answer'
  #get '/profile/master/inwork' => 'profile#master_inwork'
  #get '/profile/master/finish' => 'profile#master_finish'
  #get '/profile/master/achive' => 'profile#master_achive'
  get '/profile/settings' => 'profile#settings'
  get '/profile/balance' => 'profile#balance'
  get '/profile/messages' => 'profile#messages'
  get '/profile/messages/orders' => 'profile#messages_orders'
  get '/profile/messages/:id' => 'profile#messages_get'
  #get '/profile/master/messages/:id' => 'profile#messages_get_master'
  get '/profile/orders' => 'profile#orders'
  get '/profile/myorders' => 'profile#myorders'
  get '/profile/audiomessages' => 'profile#audiomessages'
  get '/profile/audiomessages/orders' => 'profile#audiomessages_orders'
  get '/profile/audiomessages/:id' => 'profile#audiomessages_get'

  #get '/profile/master/settings' => 'profile#settings_master'
  #get '/profile/master/balance' => 'profile#balance_master'
  #get '/profile/master/messages' => 'profile#messages_master'
  #get '/profile/master/messages/orders' => 'profile#master_messages_orders'
  #get '/profile/master/messages/:id' => 'profile#messages_get_master'
  #get '/profile/master/orders' => 'profile#orders_master'

  get '/profile/users-favorite' => 'profile#users_favorite'
  get '/profile/tasks-favorite' => 'profile#tasks_favorite'
  get '/profile/recalls' => 'profile#recalls'
  

  post '/profile/save' => 'profile#save'
  post '/profile/add_photo' => 'profile#add_photo'
  get '/profile/delete_image/:id' => 'profile#delete_photo'
  post '/profile/add_uarticle' => 'profile#add_uarticle'
  get '/profile/delete_uarticle/:id' => 'profile#delete_uarticle'
  post '/profile/add_audio' => 'profile#add_audio'
  get '/profile/delete_audio/:id' => 'profile#delete_audio'
  post '/profile/message' => 'profile#message'
  post '/profile/audiomessage' => 'profile#audiomessage'
  post '/profile/message_order' => 'profile#message_order'
  get '/profile/step1' => 'profile#step1'
  post '/profile/step2_1' => 'profile#step2_1'
  post '/profile/step2_2' => 'profile#step2_2'
  post '/profile/step2_3' => 'profile#step2_3'
  post '/profile/step2_4' => 'profile#step2_4'
  post '/profile/step2_5' => 'profile#step2_5'
  post '/profile/step_3' => 'profile#step3'
  post '/profile/answer/save' => 'profile#answer_save'
  post '/answer_remove' => 'profile#answer_remove'
  post '/set_user_type' => 'profile#set_user_type'
  post '/profile/recall' => 'profile#recall'
  post '/message_delete' => 'profile#message_delete'

  get '/city-serach' => 'home#city_serach'
  get '/status' => 'home#status'
  get '/kak-eto-rabotaet' => 'home#kak_eto_rabotaet'
  get '/questions' => 'home#questions'
  get '/blank' => 'home#blank'

  get '/cats' => 'maincat#index'
  get '/cat/:id' => 'maincat#get'

  #get '/users/:id' => 'users#get'
  post '/like' => 'users#like'
  post '/new_user_reg' => 'users#new_user_reg'
  post '/new_user' => 'users#new_user'


  post '/create-task' => 'home#create_task'
  post '/get_notify' => 'home#get_notify'
  post '/change_task_ptype' => 'home#change_task_ptype'
  post '/change_user_ptype' => 'home#change_user_ptype'

  post '/set_theme' => 'home#set_theme'
  post '/add_to_favuser' => 'home#add_to_favuser'
  post '/add_to_favtask' => 'home#add_to_favtask'


  get '/:url' => 'users#get'
  get '/:url' => 'home#article'

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
