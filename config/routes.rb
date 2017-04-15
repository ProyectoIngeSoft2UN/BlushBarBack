Rails.application.routes.draw do
  devise_for :admins
  devise_for :employees
  devise_for :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'welcome#index'
  resources :clients, :employees, :stores, :appointments
  #resources :admins
  #root to: 'admins#index'

  #resources de rutas creadas para la serializacion
  resources :appointments do
    root to: 'appointments#index'
  end

  resources :bills do
    root to: 'bills#index'
  end

  resources :images do
    root to: 'images#index'
  end

  resources :services do
    root to: 'services#index'
  end

  resources :stockstores do
    root to: 'stockstores#index'
  end
  resources :products do
    root to: 'products#index'
  end
  resources :stores do
    root to: 'stores#index'
  end

  resources :admins do
    root to: 'admins#index'
  	resources :stores
  end

  namespace :clients do
    root to: 'clients#index'
  	resources :purchases, :appointments
  end

  resources :employee do
    root to: 'employee#index'
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

  resources :images
  # resources :products
  resources :categories do
    root to: 'categories#index'
  	resources :products, only: [:list, :show]
  end

end
