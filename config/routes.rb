Rails.application.routes.draw do
  namespace :api do
    resources :wishlists do
      resources :wishlist_items, path: 'items'
    end
  end

  root :to => 'home#index'

  mount ShopifyApp::Engine, at: '/'
end
