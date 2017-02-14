Rails.application.routes.draw do
  # get 'patients/new'
  #
  # get 'patients/show'
  #
  # get 'patients/edit'
  #
  # get '/patients/:id', to: 'patients#update', as: 'patient'
  #
  # get 'patients/destroy'

  # get 'patient_admissions/index'
  #
  # get 'patient_admissions/new'
  #
  # get 'patient_admissions/show'
  #
  # get 'patient_admissions/edit'
  #
  # get 'patient_admissions/update'
  #
  # get 'patient_admissions/destroy'

  delete "logout" => "users#destroy"
  get "meanstesting" => "patient_admissions#meanstesting"
  resources :users
  resources :patients
  resources :patient_admissions
  root "users#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
