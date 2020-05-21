class ApplicationController < ActionController::Base
  include AuthHelper
  helper_method :current_user, :respondent_signed_in?, :admin_signed_in?
end
