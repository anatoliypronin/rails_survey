class AdminMailer < ApplicationMailer
  def welcome_email
    @admin = params[:admin]
    mail(to: @admin.email, subject: 'Welcome')
  end
end
