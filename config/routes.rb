Rails.application.routes.draw do
  root to: 'posts#index' # Defina 'posts#index' como a página inicial, mas você pode escolher a rota desejada.
    resources :posts
    resources :users
end
