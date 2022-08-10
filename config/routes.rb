Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }, path:"", path_names: { sign_in: '/connexion', sign_up: '/inscription'}
  root to: "pages#home"
  get '/cgu', to: "pages#cgu"
  get '/dashboard', to: "pages#dashboard"
  resources :profil
  resources :user_socials
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
