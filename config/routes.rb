Rails.application.routes.draw do

  
  scope "(:locale)", locale: /es-CL|en/ do
    get '/:locale' => 'publics#home'
    root 'publics#home'

    devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
    }

    resources :sales do
      resources :shopping_carts
    end

    resources :delivery_types
    resources :payment_types
    resources :products

    resources :types do
      resources :subtypes
    end
    resources :clients do
      resources :adresses
    end
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
