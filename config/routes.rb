Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    get '/admin' => 'homes#top'
    resources :items, :except => :destroy
    resources :genres, :except => [:new, :show, :destroy]

    resources :customers, :except => [:new, :create, :destroy] do
      member do
        patch "withdraw"
            #ユーザーの会員状況を更新
      end
    end
    resources :orders, :only => [:show, :update, :index]

    resources :order_items, :only => :update
  end

  scope module: :customer do
    root to: 'homes#top'
    get 'home/about' => 'homes#about'
    resources :items, :only => [:index, :show]
    resources :cart_items, :only => [:create, :index, :destroy, :update] do
     collection do
     delete 'destroy_all'
      end
     end


    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, :only => [:new, :create, :index, :show]


    patch 'customers/mypage' => 'customers#update'
    get 'customers/mypage/edit' => 'customers#edit'
    get 'customers/mypage' => 'customers#show'
    get 'customers/check' => 'customers#check'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :shippings, :except => [:new, :show]
  end


end
