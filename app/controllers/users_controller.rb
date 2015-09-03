class UsersController < ApplicationController
  before_action { @user = User.find_by(id: params[:id] || session[:user_id]) }

  def index
    @users = User.all
  end

  def create
    User.create(params.require(:user)
        .permit(:login, :password, :email, :website))
    redirect_to users_path
  end

  def destroy
    @user.delete
    redirect_to users_path
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    user = params.require(:user).permit(:login, :password)
    @user.update_attributes(user)
    redirect_to users_path
  end
end
