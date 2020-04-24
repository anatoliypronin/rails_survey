class SessionsController < ApplicationController
  def new
  end
  
  def create
    admin = Admin.find_by(email: params[:user][:email])

    if admin && admin.authenticate(params[:user][:password])
      session[:admin_id] = admin.id
      redirect_to admin_root_path
    else
      render action: :new
    end

  end

  def destroy
    session.delete(:admin_id)
    redirect_to new_session_path
  end
end
