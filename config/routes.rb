Rails.application.routes.draw do
  resources :articles
  root 'home#index'
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
