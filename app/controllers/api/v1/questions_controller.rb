class Api::V1::QuestionsController < Api::V1::ApplicationController
  def index
    questions = Question.all
    render json: questions, each_serializer: QuestionIndexSerializer
  end

  # def show
    # question = Question.where().find(params[:id]))
    # render json: question, serializer: QuestionShowSerializer
  # end
end
