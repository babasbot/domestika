Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  resources :teachers, only: %i[new create]
end
