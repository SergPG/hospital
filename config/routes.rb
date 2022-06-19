Rails.application.routes.draw do
  devise_for :profiles, controllers: {
    registrations: 'profiles/registrations'
  }

  ActiveAdmin.routes(self)
  
   get 'home/index'
   root to: 'home#index'
   resources :profiles, only: [:show]

   resources :appointments do
    patch :complete, on: :member
   end
   
   resources :users, only: [:show]
    

end
