# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: %i[index new create destroy] do
    resources :notifications
  end
end
