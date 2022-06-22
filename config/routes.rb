# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  ActiveAdmin.routes(self)

  get 'home/index'
  root to: 'home#index'
  resources :users, only: [:show]

  resources :appointments do
    patch :complete, on: :member
  end

  resources :patients, only: [:show]
end
