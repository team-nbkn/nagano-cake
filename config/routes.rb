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

    get 'costomers/withdraw/:id' => 'costomers#withdraw'
    resource :costomers

    get 'products/top' => 'products#top'
    resources :products, only: [:index, :show], param: :id

    delete 'cart_items' => 'cart_items#all_destroy'
    resources :cart_items, only: [:show, :create, :update, :destroy]

    resources :shippings, only: [:index, :edit, :create, :update, :destroy]

    get 'order_infomations/confirm' => 'order_infomations#confirm'
    post 'order_infomations/confirm' => 'order_infomations#create'
    get 'order_infomations/thank' => 'order_infomations#thank'
    resources :order_infomations, only: [:new, :create, :index, :show]

  end


  namespace :admins do

    resources :costomers, only: [:show, :edit, :update, :index]
    get '/top' => 'costomers#top'

    resources :costomers, only: [:show, :edit, :update, :index]

    resources :products, only: [:create, :update, :edit, :index, :show, :new]

    resources :categories, only: [:index, :edit, :create, :update]

    resources :order_informations, only: [:index, :show, :update]

  end

end
