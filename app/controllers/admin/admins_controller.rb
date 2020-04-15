class Admin::AdminsController < Admin::ApplicationController
  def new
    @admin = Admin.new
  end
end
