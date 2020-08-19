Rails.application.routes.draw do
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

  resources :assessments, except:[:edit, :new]
  resources :subjects, except:[:edit, :new]
  resources :enrollments, except:[:edit, :new]
  resources :grades, except:[:edit, :new]
  resources :courses, except:[:edit, :new]
  root 'home#index'
  get 'contact' => 'home#contact'
  post 'contact' => 'home#request_contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Handle unknown routes
  match '*path' => redirect('/'), via: :get

end
