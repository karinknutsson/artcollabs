Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :project_chats, only: :show do
    resources :messages, only: :create
  end

  resources :projects do
    resources :collaborations
    resources :milestones
  end

  patch '/confirm/:id', to: 'collaboration#confirm', as: "confirm"
  delete "project/:id", to: "projects#destroy", as: "delete_project"
end
