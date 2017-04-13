Rails.application.routes.draw do
  devise_for :admins
  devise_for :employees
  devise_for :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'welcome#index'
  resources :clients, :employees, :stores, :appointments
  #resources :admins
  #root to: 'admins#index'

  resources :admins do
  	resources :stores
  end

  namespace :clients do
  	resources :purchases, :appointments
  end

  resources :employee do
  	resources :appointments;
  end
  #Rutas de consulta límitadas a :list y :show
  namespace :stores do
  	resources :products, only: [:list, :show] do
  		resources :images, :categories, only: [:list, :show]
  	end
  	resources :employees do
  		resources :appointments
  	end
  end

  resources :categories do
  	resources :products, only: [:list, :show]
  end

end
