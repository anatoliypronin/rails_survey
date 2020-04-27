module AuthHelper
  def user_sign_in(user)
    session[:user_id] = user.id
  end

  def user_sign_out
    session.delete(:user_id)
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def admin_signed_in?
    current_user&.is_a? Admin
  end

  def authenticate_admin!
    redirect_to new_admin_session_path unless admin_signed_in?
  end
end
