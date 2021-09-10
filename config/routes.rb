Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
    post 'sign_up', to: 'devise/registrations#create'
    get 'sign_in', to: 'devise/sessions#new'
    post 'sign_in', to: 'devise/sessions#create'
    get 'sign_out', to: 'devise/sessions#destroy', as: :sign_out
    delete 'sign_out', to: 'devise/sessions#destroy'
    get 'profile/edit', to: 'devise/registrations#edit'
  
  end
  get 'user/:id', to: 'users#show'
  get 'users', to: 'users#index'
  resources :user
  resources :articles
  get 'new-article', to: 'articles#new'
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
  root 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
