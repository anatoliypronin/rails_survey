Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  namespace :admin do
    root to: 'users#index'
    resources :users, only: %i[index show edit update] do
      member do
        put 'in_archive'
        put 'restore'
      end
    end
    resources :admins, only: %i[new create]
    resources :respondents, only: %i[new create]
  end
end
