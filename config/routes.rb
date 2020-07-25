Rails.application.routes.draw do
  devise_for :users
  resources :subjects
  resources :assesments
  resources :enrollments
  resources :grades
  resources :courses
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
