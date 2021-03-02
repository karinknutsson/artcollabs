Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users
  root to: 'pages#home'


  resources :project_chats, only: :show do
    resources :messages, only: :create
  end

  resources :chatrooms, only: :show do
    resources :direct_messages, only: :create
  end

  resources :projects do
    resources :collaborations
    resources :milestones
    resources :favourite_projects, only: [ :new, :create, :destroy ]
  end

  get '/tagged', to: "projects#tagged", as: :tagged
  
  get '/project/:id/media', to: "projects#media", as: "media"

  get '/profile/:id', to: 'pages#profile', as: "profile"
  get '/dashboard/', to: 'pages#dashboard', as: "dashboard"


  patch '/confirm/:id', to: 'collaborations#confirm', as: "confirm"
  patch '/confirm/:id', to: 'collaborations#deny', as: "deny"

  mount ActionCable.server => "/cable"
end
