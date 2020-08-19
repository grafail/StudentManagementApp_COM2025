Rails.application.routes.draw do
  resources :assessments
  get 'admin/index'
  get 'admin/user/:id' => "admin#user", :as => "user_show"
  get 'admin/user/role/:id' => "admin#role", :as => "user_role"
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  devise_scope :user do
    patch 'users/:id', to: 'users/registrations#update_info'
    delete 'users/:id', to: 'users/registrations#deleteUser', as: :admin_destroy_user
  end

  resources :subjects
  resources :enrollments
  resources :grades
  resources :courses
  root 'home#index'
  get 'contact' => 'home#contact'
  post 'contact' => 'home#request_contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
