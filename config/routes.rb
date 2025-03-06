Rails.application.routes.draw do
  get "chapters/index"
  get "chapters/show"
  get "chapters/new"
  get "chapters/create"
  get "novels/index"
  get "novels/show"
  get "novels/new"
  get "novels/create"
  # Routes for Novels
  resources :novels do
    resources :chapters, only: [:index, :show, :new, :create]
  end

  # Health check endpoint
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Root path now points to novels index
  root "novels#index"
end
