class Web::Respondent::AnswersController < Web::Respondent::ApplicationController
  def new
    @questions = Survey.find(params[:survey_id]).questions
  end

  def create
  end
end
