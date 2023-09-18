Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts do
    resources :comments, only: [:create, :destroy, :index]
  end

  resources :users

  # Recursos independentes para gerenciar todos os comentários
  resources :comments, only: [:show]

  # Rota para obter o token CSRF
  get '/get_csrf_token', to: 'comments#get_csrf_token'
end
