Rails.application.routes.draw do
  root "projects#index"
  resources :projects, only: [:index, :show, :create] do
    resources :comments, only: [:create, :index]  # add other actions if needed
    resources :status_changes, only: [:create]

  end
end