class Web::Respondent::SessionsController < Web::Respondent::ApplicationController
  skip_before_action :authenticate_respondent!, only: %i[new create]

  def new; end

  def create
    user = User.find_by(phone: params[:respondent][:phone])
    if user&.authenticate(params[:respondent][:phone])
      user_sign_in(user)
      redirect_to respondent_root_path
    else
      render action: :new
    end
  end

  def destroy
    user_sign_out
    redirect_to new_respondent_session_path
  end
end

