class SessionsController < ApplicationController
  def new
  end
  
  def create
    admin = Admin.find_by(email: params[:admin][:email])

    if admin && admin.authenticate(params[:admin][:password])
      session[:admin_id] = admin.id
      redirect_to admin_root_path
    else
      render action: :new
    end

  end

  def destroy
  end
end
