Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'login'  => 'placeholder#login',   :as => 'login'
  get  'login'  => 'placeholder#landing', :as => 'landing'

  match '/auth/:provider/callback', to: "sessions#create", via: [:get, :post]
  get 'signin' => "sessions#signin", :as => :signin
  get '/signout' => 'sessions#signout', :as => :signout

  root 'placeholder#home'
  resources :quizzes
  resources :response
  get 'quiz', to: 'quizzes#quiz', as: :take_quiz

  get 'profile/:id'=> 'profile#show', :as => 'show_profile'
  get 'profile/:id/edit' => 'profile#edit', :as => 'edit_profile'
  post 'profile/:id' => 'profile#update', :as => 'update_profile'
end
