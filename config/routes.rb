Rails.application.routes.draw do
  root to: "sessions#new"
  resources :users do
    resources :feeds, only: [:index]
  end
    resources :circles
  resource :session
  resources :posts 
    resources :links

end
