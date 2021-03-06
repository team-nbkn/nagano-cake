Rails.application.routes.draw do
  root to: 'costomers/products#top'
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
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
    # post 'order_infomations/confirm' => 'order_infomations#confirm_new'
    get 'order_infomations/thank' => 'order_infomations#thank'
    resources :order_infomations, only: [:new, :create, :index, :show]
    # do
    #   collection do
    #     post :confirm
    #   end
    # end

  end


  namespace :admins do

    resources :costomers, only: [:show, :edit, :update, :index]
    get '/top' => 'costomers#top'

    resources :costomers, only: [:show, :edit, :update, :index]

    resources :products, only: [:create, :update, :edit, :index, :show, :new]

    resources :categories, only: [:index, :edit, :create, :update]

    resources :order_informations, only: [:index, :show, :update]
    patch 'order_informations/:id/order_product_update' => 'order_informations#order_product_update'
  end

end
