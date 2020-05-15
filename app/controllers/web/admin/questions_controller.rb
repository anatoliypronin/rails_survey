class Web::Admin::QuestionsController < Web::Admin::ApplicationController
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

    if @survey
      @question.survey = @survey
    end

    if @question.save
      redirect_to admin_survey_path(@survey)
    else
      render action: :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to admin_survey_path(@question.survey_id)
  end

  private

  def question_attrs
    params.require(:question).permit(:title, :position, :kind, :survey_id)
  end
end
