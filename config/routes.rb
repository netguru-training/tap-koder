Rails.application.routes.draw do
  resources :offers do
    resources :codes, only: [:create]
  end

  root :to => "visitors#index"
  devise_for :users
end
