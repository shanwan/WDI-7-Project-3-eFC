Rails.application.routes.draw do

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources :users
  resources :wards do
    patch 'reduce' => 'wards#reduce'
  end
  resources :patients do
    member do
      get :edit2
      get :edit3
      patch :update2
      patch :update3
    end
  end
  resources :patient_admissions
  root "sessions#new"
  resources :insurance
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
