class Api::V1::QuestionsController < Api::V1::ApplicationController
  def index
    questions = Question.where(survey_id: params[:survey_id])
    render json: questions, each_serializer: QuestionIndexSerializer
  end
end
