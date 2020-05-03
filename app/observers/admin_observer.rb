class AdminObserver < ActiveRecord::Observer
  observe :admin
  
  def after_commit(record)
    AdminMailer.welcome_email(record).deliver_now
  end
end
