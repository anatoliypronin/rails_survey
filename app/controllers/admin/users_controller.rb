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

    if @user.update(send("#{@user.type.downcase}_attrs"))
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def respondent_attrs
    params.require(:respondent).permit(:first_name, :last_name, :phone)
  end

  def admin_attrs
    params.require(:admin).permit(:first_name, :last_name, :email, :password)
  end
end
