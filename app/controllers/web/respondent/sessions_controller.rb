class Web::Respondent::SessionsController < Web::Respondent::ApplicationController
  skip_before_action :authenticate_respondent!, only: %i[new create]

  def new
    redirect_to(session[:url] || respondent_root_path) if respondent_signed_in?
  end

  def create
    if (user = User.find_by(phone: params[:respondent][:phone]))
      user_sign_in(user)
      if session[:url] == respondent_session_path
        redirect_to respondent_root_path
      else
        redirect_to(session[:url] || respondent_root_path)
      end
    else
      render action: :new
    end
  end

  def destroy
    user_sign_out
    redirect_to root_path
  end
end
