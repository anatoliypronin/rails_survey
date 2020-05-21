class Api::V1::SurveysController < Api::V1::ApplicationController
  def index
    surveys = Survey.where(state: :active, public: true).order(title: :asc).decorate
    render json: surveys, each_serializer: SurveyIndexSerializer
  end

  def show
    survey = Survey.where(state: :active).find(params[:id])
    render json: survey, serializer: SurveyShowSerializer
  end
end
