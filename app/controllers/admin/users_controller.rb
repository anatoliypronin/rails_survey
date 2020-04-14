class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_attrs
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :password)
  end
  
end