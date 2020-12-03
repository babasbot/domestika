Rails.application.routes.draw do
  root to: 'courses#index'

  resource :session, only: %i[new create destroy]

  resources :courses, only: %i[index new create show] do
    resource :vote, only: %i[create destroy]
  end

  resources :teachers, only: %i[new create]

  resources :proposals, only: %i[] do
    resource :vote, only: %i[create destroy]
  end

  if Rails.env.test?
    namespace :test do
      post :session, to: 'sessions#create'
    end
  end
end
