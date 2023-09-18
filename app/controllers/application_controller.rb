class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    # Lógica para obter o usuário atual, por exemplo, usando Devise ou outra gem de autenticação
    # Por exemplo, se você estiver usando o Devise:
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
