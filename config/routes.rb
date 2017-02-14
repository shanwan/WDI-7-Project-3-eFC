Rails.application.routes.draw do
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  # get "mcaf" => "patients#mcaf"
  # patch "mcaf" => "patients#mcafupdate"
  resources :users
  resources :patients do
    member do
      get :edit2
      patch :update2
    end
  end
  resources :patient_admissions
  root "sessions#new"
  resources :insurance
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
