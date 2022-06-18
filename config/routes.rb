Rails.application.routes.draw do
  devise_for :profiles
  

   get 'home/index'
   root to: 'home#index'
   resources :profiles, only: [:show]
  
   resources :appointments 

end
