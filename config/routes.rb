Rails.application.routes.draw do
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

      resources :surveys, only: %i[index new create show edit update destroy], shallow:true  do
        resources :questions, only: %i[index new create destroy show], shallow: true do
        resources :variants, only: %i[index new create destroy edit update show]

        member do
          put :del
          put :restore
        end
      end
    end

    scope module: :question do
      resources :questions, only: %i[index]
    end
    resources :variants, only: %i[index]
    resources :tags
  end
end
