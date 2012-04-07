Jilliankozyra::Application.routes.draw do
  
  resources :parties

  resources :participants

  root :to => "home#index"
  
  resources :surveys
  
  resources :languages

  resources :question_groups

  resources :choices

  resources :sessions

  resources :users

  resources :answers

  resources :questions
  
  
  match "administration" => "administration#index"
  match "administration/index" => "administration#index"
  match "administration/invite_participants" => "administration#invite_participants"
  match "administration/notify_participants" => "administration#notify_participants"
  match "administration/submit_invite_participants" => "administration#submit_invite_participants"
  match "administration/submit_notify_participants" => "administration#submit_notify_participants"
  match "administration/load_records" => "administration#load_records"
  match 'surveys/:id/:survey_code' => 'surveys#choose_language', :as => "choose_language"
  match 'surveys_home' => 'surveys#home', :as => "surveys_home"
  match 'surveys/load_questions' => 'surveys#load_questions', :as => "load_questions"
  match 'surveys/change_language' => 'surveys#change_language'
  match 'submit_survey' => 'answers#submit_survey'
  match 'thanks' => 'surveys#thanks', :as => :thanks
  match 'about' => 'home#about', :as => :about
  match 'login' => 'sessions#new'
  match 'logout' => 'sessions#destroy'


  

  #get "home/about"

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
