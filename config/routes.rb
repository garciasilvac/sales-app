Rails.application.routes.draw do
  
  
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
  
  root 'sales#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
