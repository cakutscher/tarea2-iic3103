Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/usuarios' => 'api/users#index'
  namespace :api, defaults: { format: :json } do
    resources :users, :only => [:show, :create, :update, :destroy]
  end
end
