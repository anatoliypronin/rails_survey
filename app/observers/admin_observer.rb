class AdminObserver < ActiveRecord::Observer
  observe :admin
  
  def after_save(record)
    AdminMailer.welcome_email(record).deliver_now
  end
end
