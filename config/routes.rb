Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: %i[index show edit update]
  end
end
