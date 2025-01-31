Rails.application.routes.draw do
  namespace :api do
    resources :wishlists
  end

  root :to => 'home#index'

  mount ShopifyApp::Engine, at: '/'
end
