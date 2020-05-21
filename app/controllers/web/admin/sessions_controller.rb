class Web::Admin::SessionsController < Web::Admin::ApplicationController
  skip_before_action :authenticate_admin!, only: %i[new create]
  def new; end

  def create
    user = User.find_by(email: params[:admin][:email])
    if user&.authenticate(params[:admin][:password])
      user_sign_in(user)
      redirect_to admin_root_path
    else
      render action: :new
    end
  end

  def destroy
    user_sign_out
    redirect_to root_path
  end
end
