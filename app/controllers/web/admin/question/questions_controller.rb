class Web::Admin::Question::QuestionsController < Web::Admin::Question::ApplicationController
  def index
    @questions = Question.all
  end
end
