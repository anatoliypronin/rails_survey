class AdminMailer < ApplicationMailer
  def welcome_email(admin)
    @admin = admin
    mail(to: @admin.email, subject: 'Welcome')
  end
end
