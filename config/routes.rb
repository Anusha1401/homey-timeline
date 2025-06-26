Rails.application.routes.draw do
  root "projects#show", defaults: { id: 1 }
  resources :projects do
    resources :comments, only: [:create, :index]  # add other actions if needed
    resources :status_changes, only: [:create]

  end
end