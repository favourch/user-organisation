class WelcomeController < ApplicationController
  skip_before_action :ensure_authenticated

  def index
    redirect_to dashboard_path if User.find_by(id: session[:user_id])
  end

  def login
    user = User.authenticate(params[:login], params[:password])
    session[:user_id] = user.try(:id)
    redirect_to(user ? dashboard_path : root_path)
  end
end
