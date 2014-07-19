Rails.application.routes.draw do
  resources :offers
  root :to => "visitors#index"
  devise_for :users
end
