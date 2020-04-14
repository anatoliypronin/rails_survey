class Admin::RespondentsController < Admin::ApplicationController
  def new
    @respondent = Respondent.new
  end
  
end
