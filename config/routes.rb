Rails.application.routes.draw do
   resources :kmls, only: [:index, :new, :create, :destroy]
   root "kmls#index"
end