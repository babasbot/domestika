Rails.application.routes.draw do
  root to: 'courses#index'

  resource :session, only: %i[new create destroy]

  resources :courses,  only: %i[index]
  resources :teachers, only: %i[new create]

  if Rails.env.test?
    namespace :test do
      post :session, to: 'sessions#create'
    end
  end
end
