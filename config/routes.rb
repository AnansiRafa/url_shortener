Rails.application.routes.draw do
  root 'urls#index'
  get '/urls', to: 'urls#index'
  get '/:id', to: 'urls#show'
  resources :urls
  # For details oon the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
