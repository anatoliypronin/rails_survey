class Web::Respondent::QuestionsController < Web::Respondent::ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.new(question_attrs)
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_attrs)
    @survey = Survey.find(params[:survey_id])

    @question.survey = @survey if @survey

    if @question.save
      redirect_to respondent_survey_path(@survey)
    else
      render action: :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to respondent_survey_path(@question.survey_id)
  end

  private

  def question_attrs
    params.require(:question).permit(:title, :position, :kind, :survey_id)
  end
end
