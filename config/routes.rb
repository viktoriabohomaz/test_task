Rails.application.routes.draw do
  resources :users do
    resources :notifications
  end
end
