Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/usuario' => 'api/users#index'
  put '/usuario' => 'api/users#create'
  post '/usuario/:id' => 'api/users#update'
  delete '/usuario/:id' => 'api/users#destroy'
  get '/usuario/:id' => 'api/users#show'

=begin
  namespace :api, defaults: { format: :json } do
    resources :users, :only => [:show, :destroy]
  end
=end

namespace :api, defaults: { format: :json } do
  resources :users, :only => [:show, :destroy]
end


end
