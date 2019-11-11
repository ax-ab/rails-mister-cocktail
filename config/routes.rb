Rails.application.routes.draw do
  root 'cocktails#home'
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:edit, :update, :destroy]
end
