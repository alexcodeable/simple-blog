Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
    post 'sign_up', to: 'devise/registrations#create'
    get 'sign_in', to: 'devise/sessions#new'
    post 'sign_in', to: 'devise/sessions#create'
    delete 'sign_out', to: 'devise/sessions#destroy'
    
  end
  resources :articles
  get 'profile/:id', to: 'users#show'
  get 'all_profiles', to: 'users#index'
  get 'new-article', to: 'articles#new'
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
  root 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
