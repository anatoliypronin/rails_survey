class Web::Respondent::SurveysController < Web::Respondent::ApplicationController
  def index
    @surveys = Survey.where(user_id: session[:user_id], state: :active).all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_attrs)
    @survey.user_id = session[:user_id]

    if @survey.save
      redirect_to respondent_surveys_path
    else
      render action: :new
    end
  end

  def show
    @survey = Survey.where(user_id: session[:user_id]).find(params[:id]).decorate
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    survey_attrs = send("survey_attrs")
    if @survey.update(survey_attrs)
      redirect_to action: :show
    else
      render action: :edit
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
    params.require(:survey).permit(:title, :public, :state_event, :user_id, tag_ids: [])
  end
end
