Rails.application.routes.draw do
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

  resources :users
  resources :patient_admissions
  root "users#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
