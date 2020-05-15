Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :surveys, only: %i[index show]
    end
  end
  scope module: :web do
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
      resources :questions, only: %i[index new create destroy]
      resources :variants, only: %i[index new create destroy edit update]
      resources :tags
      resources :surveys, only: %i[index new create show edit update destroy] do
        member do
          put :del
          put :restore
        end
      end
    end
  end
end
