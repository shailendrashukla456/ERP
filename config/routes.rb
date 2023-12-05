Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 
  resources :employees do
    resources :departments
    resources :leavetypes
    resources :salaries
  end
 
  resources :departments
  resources :leavetypes
  resources :salaries
end
