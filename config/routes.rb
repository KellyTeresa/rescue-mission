Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :questions do
    resources :answers, only: [:index, :new, :create]
  end

  resources :answers, only: [:edit]

end
