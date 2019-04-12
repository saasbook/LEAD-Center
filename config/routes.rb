Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'login'  => 'placeholder#login',   :as => 'login'
  get  'login'  => 'placeholder#landing', :as => 'landing'

  root 'placeholder#home'
  resources :quizzes
  resources :response
  get 'quiz', to: 'quizzes#quiz', as: :take_quiz

  get 'profile/:id'=> 'profile#show', :as => 'show'
  get 'profile/:id/edit' => 'profile#edit', :as => 'edit'
  post 'profile/:id/edit' => 'profile#edit', :as => 'edit_profile'
  post 'profile/:id' => 'profile#update', :as => 'update_profile'
end
