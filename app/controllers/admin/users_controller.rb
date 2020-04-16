class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    user_attrs = "#{@user.type.downcase}_attrs"
    if @user.update(send(user_attrs))
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def in_archive
    user = User.find(params[:id])
    user.in_archive
    redirect_to action: :index
  end

  def restore
    user = User.find(params[:id])
    user.restore
    redirect_to action: :index
  end

  private

  def respondent_attrs
    params.require(:respondent).permit(:first_name, :last_name, :state_event, :phone)
  end

  def admin_attrs
    params.require(:admin).permit(:first_name, :last_name, :email, :state_event, :password)
  end
end
