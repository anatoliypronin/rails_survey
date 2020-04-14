Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: %i[index show edit update]
    resources :admins, only: %i[new create]
    resources :respondents, only: %i[new create]
  end
end
