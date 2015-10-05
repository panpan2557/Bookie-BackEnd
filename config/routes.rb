require 'api_constraints'

Rails.application.routes.draw do
  devise_for :members
  # Api definition
  namespace :api, defaults: { format: :json }, constraints: { }, path: '/api' do
    # We are going to list our resources here
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      resources :members, :only => [:show, :create, :update, :destroy] do
        resources :addresses
      end
      resources :sessions, :only => [:create, :destroy]
      get '/myprofile' => 'members#profile_detail'
    end
  end
end
