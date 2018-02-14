Rails.application.routes.draw do
  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # changed the route names, removed the users from: localhost: 3000/users/sign_up amd chenged sign_in for login, sign_out for logout and
  # sign_up for register
  root to: 'pics#index'
  resources :pics do
    member do
      put 'like' => 'pics#vote'
    end
  end 
  get 'user_pics' => 'pics#user_pics', as: 'user_pics_index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end