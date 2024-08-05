Rails.application.routes.draw do
  resources :order_parties
  resources :order_parties
  resources :defects
  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'auth/:provider/callback', to: 'sessions#create'
  get  'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  scope "(:locale)", locale: /en|zh/ do

    resources :items do  
        resources :photos, only: [:create, :destroy] do
          collection do
            post :create_general     #-> domain.com/orders/:id/acknowledge
            post :create_before     #-> domain.com/orders/:id/acknowledge
            post :create_after     #-> domain.com/orders/:id/acknowledge
            post :insert                #-> domain.com/orders/:id/acknowledge
          end
          member do
            put  :switch_printable     #-> domain.com/orders/:id/delete+photo
          end
        end
      end
      
    resources :defects
    resources :issues
    resources :defects
    resources :sources
    resources :districts
    resources :orders do  
        member do
          put :cancel         #-> domain.com/orders/:id/complete
          put :file        #-> domain.com/complaints/:id/escalate 
        end
        resource :downloadpdf, only: [:show] 
        resources :comments
        collection do
          match 'search' => 'orders#search', via: [:get, :post], as: :search
        end
        # collection { post :search, to: 'orders#search' }
        resources :photos, only: [:create, :destroy] do
          collection do
            post :create_general     #-> domain.com/orders/:id/acknowledge
            post :create_before     #-> domain.com/orders/:id/acknowledge
            post :create_after     #-> domain.com/orders/:id/acknowledge
            post :insert                #-> domain.com/orders/:id/acknowledge
          end
          member do
            put  :switch_printable     #-> domain.com/orders/:id/delete+photo
          end
        end
      end

     # mount Upmin::Engine => '/admin'
	 # root to: 'visitors#index' 
     root to: 'visitors#mos'
     get "customer_faq" => "visitors#faq"
     get "partner_faq"  => "visitors#faq2"
     get "about"  => "visitors#about"
     # devise_for :users
     # devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
     resources :users
        resources :orders do 
       collection do 
        get :open
      end
    end
  end
end
