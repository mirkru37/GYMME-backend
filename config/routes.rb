# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create]
      resources :sessions, only: %i[create]
      namespace :sessions do
        post :refresh
      end
    end
  end
end
