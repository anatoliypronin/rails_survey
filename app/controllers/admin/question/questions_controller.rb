class Admin::Question::QuestionsController < Admin::Question::ApplicationController
  def index
    @questions = Question.all
  end
end
