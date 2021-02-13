Rails.application.routes.draw do
  get 'collaborations/new'
  get 'collaborations/create'
  get 'collaborations/edit'
  get 'collaborations/update'
  get 'collaborations/destroy'
  get 'milestones/show'
  get 'milestones/create'
  get 'milestones/edit'
  get 'milestones/update'
  get 'milestones/destroy'
  # get 'projects/show'
  # get 'projects/new'
  # get 'projects/create'
  # get 'projects/edit'
  # get 'projects/update'
  # get 'projects/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :milestones
  end

  resources :collaborations
  
end
