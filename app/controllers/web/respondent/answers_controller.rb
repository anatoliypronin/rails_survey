class Web::Respondent::AnswersController < Web::Respondent::ApplicationController
  def new
    @questions = Survey.first.questions
  end
end
