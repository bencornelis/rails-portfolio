Rails.application.routes.draw do
  root to: "skills#index"
  resources :skills do
    resources :projects
  end
  resources :posts do
    resources :comments
  end
  resources :references
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end
