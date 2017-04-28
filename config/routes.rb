Rails.application.routes.draw do
  devise_for :admins
  devise_for :employees
  devise_for :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'welcome#index'
  # resources :clients, :employees, :stores, :appointments
  #resources :admins
  #root to: 'admins#index'

  #resources de rutas creadas para la serializacion
  resources :appointments do
    collection do
      get 'search_by_paid', to: 'appointments#get_appointments_by_paid'
      get 'search_by_active', to: 'appointments#get_appointments_by_active'
    end
    root to: 'appointments#index'
  end

  resources :subcategories do
    collection do
      get 'search_by_name', to: 'subcategories#get_subcategories_by_name'
    end
    root to: 'subcategories#index'
  end

  resources :references do
    collection do
      get 'search_by_name', to: 'references#get_references_by_name'
    end
    root to: 'references#index'
  end

  resources :bills do
    collection do
      get 'search_by_payment', to: 'bills#get_bills_by_payment'
      get 'search_by_cost', to: 'bills#get_bills_by_cost'
    end
    root to: 'bills#index'
  end

  resources :images do
    root to: 'images#index'
  end

  resources :services do
    collection do
      get 'search_by_name', to: 'services#get_services_by_name'
      get 'search_by_cost', to: 'services#get_services_by_cost'
    end
    root to: 'services#index'
  end

  resources :stockstores do
    collection do
      get 'search_by_available', to: 'stockstores#get_stockstores_by_available'
      get 'search_by_cost', to: 'stockstores#get_stockstores_by_cost'
    end
    root to: 'stockstores#index'
  end
  # scope '/select_products' do
  #   scope '/q' do
  #     get '(:column_name(/-:column_name))', to: 'products#get_column_name'
  #   end
  # end

  resources :products do
    collection do
      get 'search_by_name', to: 'products#get_products_by_name'
      get 'search_by_brand', to: 'products#get_products_by_brand'
      get 'search_by_cost', to: 'products#get_products_by_cost'
    end
    get 'bills', to: 'products#get_bills_by_id'
    member do
      get 'cost', to: 'products#get_cost_by_id'
    end
    root to: 'products#index'
    get '', to: 'products#show'
    # get ':id', to: 'products#show'
    # show '', to: 'products#show'
    # collection do
    #   get 'get-by-name' to: 'products#get_products_by_name'
    # end
  end
  resources :products
  resources :stores do
    collection do
      get 'search_by_address', to: 'stores#get_stores_by_address'
      get 'search_by_city', to: 'stores#get_stores_by_city'
      get 'search_by_phone', to: 'stores#get_stores_by_phone'
      get 'search_by_email', to: 'stores#get_stores_by_email'
    end
    root to: 'stores#index'
  end

  resources :admins do
    collection do
      get 'search_by_name', to: 'admins#get_admins_by_name'
      get 'search_by_lastname', to: 'admins#get_admins_by_lastname'
      get 'search_by_cc', to: 'admins#get_admins_by_cc'
      get 'search_by_email', to: 'admins#get_admins_by_email'
    end
    root to: 'admins#index'
  	resources :stores
  end

  resources :clients do
    collection do
      get 'search_by_name', to: 'clients#get_clients_by_name'
      get 'search_by_lastname', to: 'clients#get_clients_by_lastname'
      get 'search_by_cc', to: 'clients#get_clients_by_cc'
      get 'search_by_email', to: 'clients#get_clients_by_email'
    end
    root to: 'clients#index'
  	resources :purchases, :appointments
  end

  resources :employee do
    collection do
      get 'search_by_name', to: 'employees#get_employees_by_name'
      get 'search_by_lastname', to: 'employees#get_employees_by_lastname'
      get 'search_by_cc', to: 'employees#get_employees_by_cc'
      get 'search_by_email', to: 'employees#get_employees_by_email'
    end
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

  resources :images do
    member do
      get 'path', to: 'images#get_path'
    end
  end
  # resources :products
  resources :categories do
    collection do
      get 'search_by_name', to: 'categories#get_categories_by_name'
    end
    root to: 'categories#index'
  	resources :products, only: [:list, :show]
  end

end
