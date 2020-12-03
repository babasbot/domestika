Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  resources :teachers, only: %i[new create]

  if Rails.env.test?
    namespace :test do
      post :session, to: 'sessions#create'
    end
  end
end
