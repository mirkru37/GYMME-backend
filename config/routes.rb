# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create]
      resources :sessions, only: %i[create]
      resources :muscles, only: %i[index]
      resources :exercises, except: %i[new edit] do
        resources :attachments, controller: 'exercise_attachments', only: %i[create index destroy]
      end
      namespace :sessions do
        post :refresh
      end
    end
  end
end
