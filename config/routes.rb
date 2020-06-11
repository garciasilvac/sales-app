Rails.application.routes.draw do

  scope "(:locale)", locale: /es-CL|en/ do
    get '/:locale' => 'publics#home'
    root 'publics#home'

    devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
    }

    resources :clients do
      resources :adresses
    end

    resources :sales do
      member do
        get 'edit_step_2'
        patch 'update_step_2'
        get 'edit_step_3'
        patch 'update_step_3'
        get 'new_adress'
        post 'create_adress'
      end
      collection do
        get 'new_client'
        post 'create_client'
      end
      resources :shopping_carts
      resources :deliveries do
        member do
          get 'edit_step_2'
          patch 'update_step_2'
        end
      end
    end

    get 'driver_index', controller: :deliveries, action: :driver_index
    

    #### APP CONFIGURABLE OPTIONS
    resources :point_of_sales do
      resources :adresses
    end
    resources :delivery_types
    resources :payment_types
    resources :products
    resources :timeblocks
    resources :types do
      resources :subtypes
    end


    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
