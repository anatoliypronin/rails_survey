class Admin::SurveysController < Admin::ApplicationController
  def index
    @surveys = Survey.all.decorate
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_attrs)

    if @survey.save
      redirect_to admin_surveys_path
    else
      render action: :new
    end
  end

  def destroy
    survey = Survey.find(params[:id])
    survey.destroy
    redirect_to action: :index
  end

  def del
    survey = Survey.find(params[:id])
    survey.del
    redirect_to action: :index
  end

  def restore
    survey = Survey.find(params[:id])
    survey.restore
    redirect_to action: :index
  end

  def close
    survey = Survey.find(params[:id])
    survey.close
    redirect_to action: :index
  end

  def to_open
    survey = Survey.find(params[:id])
    survey.to_open
    redirect_to action: :index
  end

  private

  def survey_attrs
    params.require(:survey).permit(:title, :public, :state_event, :user_id)
  end
end
