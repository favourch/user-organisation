class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :ensure_authenticated

  def ensure_authenticated
    @user = User.find(session[:user_id])
    redirect_to(root_path) unless @user
  end
end
