Rails.application.routes.draw do
  mount Sidekiq::Web => '/3ce8b877f0aebcf9fb1072a24f3ff8c9/sidekiq'

  namespace :api do
    resources :wishlists do
      resources :wishlist_items, path: 'items'
    end

    resources :products, only: [:index]
  end

  root :to => 'home#index'

  mount ShopifyApp::Engine, at: '/'
end
