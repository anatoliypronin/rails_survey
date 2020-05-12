Rails.application.routes.draw do
  root to: "welcome#index"
  namespace :respondent do
    resource :session, only: %i[new create destroy]
  end
  namespace :admin do
    root to: "users#index"
    resource :session, only: %i[new create destroy]
    resources :users, only: %i[index show edit update] do
      member do
        put :in_archive
        put :restore
      end
    end
    resources :admins, only: %i[new create]
    resources :respondents, only: %i[new create]
    resources :surveys, only: %i[index new create show edit update destroy], shallow: true do
      resources :questions, only: %i[index new create destroy show], shallow: true do
        resources :variants, only: %i[index new create destroy edit update show]
      end
      member do
        put :del
        put :restore
      end
    end

    resources :tags
    end
  end
end
