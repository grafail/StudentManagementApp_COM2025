Rails.application.routes.draw do
  get 'admin/index'
  get 'admin/user/:id' => "admin#user"
  devise_for :users
  resources :subjects
  resources :assessments
  resources :enrollments
  resources :grades
  resources :courses
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
