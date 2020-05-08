class Admin::QuestionsController < Admin::ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @survey = Survey.find(params[:survey_id])
  end

  def edit
    @question = Question.new(question_attrs)
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_attrs)
    @survey = Survey.find(params[:survey])

    if @survey
      @question.survey = @survey
    end

    if @question.save
      redirect_to admin_survey_questions_path(@survey.id)
    else
      render action: :new
    end
  end

  def destroy
    question = Question.find(params[:id])
    @survey = Survey.find(params[:survey])

    if @survey
      @question.survey = @survey
    end

    question.destroy
    redirect_to admin_survey_questions_path
  end

  private

  def question_attrs
    params.require(:question).permit(:title, :position, :kind, :survey_id)
  end
end
