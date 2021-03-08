Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctor_surgery, only: [:new, :create]
  resources :doctor, only: [:index]
  resources :surgery, only: [:show]


end
