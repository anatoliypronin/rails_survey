class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_attrs)

    if @question.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to action: :index
  end

  private

  def question_attrs
    params.require(:question).permit(:title, :position, :kind, :survey_id)
  end
end
