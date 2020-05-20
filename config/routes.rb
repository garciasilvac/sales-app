Rails.application.routes.draw do

  scope "(:locale)", locale: /es-CL|en/ do
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
    get '/:locale' => 'sales#index'
    root 'sales#index'
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
