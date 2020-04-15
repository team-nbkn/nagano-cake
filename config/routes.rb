Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  devise_for :costomers, controllers: {
  sessions:      'costomers/sessions',
  passwords:     'costomers/passwords',
  registrations: 'costomers/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :costomers do

    resource :costomers
    patch 'costomers/withdraw' => 'costomers#d_update'

    resources :products, only: [:index, :show]
    get 'products/top' => 'products#top'

    resources :cart_items, only: [:show, :create, :update, :destroy]
    delete 'cart_items' => 'cart_items#all_destroy'

    resources :shippings, only: [:index, :edit, :create, :update, :destroy]

    resources :order_infomations, only: [:new, :create, :index, :show]
    get 'order_infomations/confirm' => 'order_infomations#confirm'
    get 'order_infomations/thank' => 'order_infomations#thank'

  end


  namespace :admins do

    resource :costomers, only: [:show, :edit, :update, :index]
    get '/top' => 'costomers#top'

    resources :products, only: [:create, :update, :edit, :index, :show]

    resources :categories, only: [:index, :edit, :create, :update]

    resources :order_infomations, only: [:index, :show, :update]

  end

end
