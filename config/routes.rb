Rails.application.routes.draw do
  namespace :admin do
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
