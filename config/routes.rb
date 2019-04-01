Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'login'  => 'placeholder#login',   :as => 'login'
  get  'login'  => 'placeholder#landing', :as => 'landing'

  root 'placeholder#home'
  resources :quizzes
end
