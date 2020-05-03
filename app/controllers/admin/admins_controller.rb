class Admin::AdminsController < Admin::ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_attrs)

    if @admin.save
      AdminMailer.welcome_email(@admin).deliver_now
      redirect_to admin_users_path
    else
      render action: :new
    end
  end

  private

  def admin_attrs
    params.require(:admin).permit(:first_name, :last_name, :email, :password)
  end
end
