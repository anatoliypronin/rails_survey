class Web::Respondent::AnswersController < Web::Respondent::ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @questions = @survey.questions
  end

  def create
    answers = params[:answers]
    answers.each do |question_id, answer|
      question = Question.find(question_id)
      if question.kind == 'input'
        answer_attrs = {
          question_id: question.id,
          title: answer
        }
        @answer = OtherField.new(answer_attrs)
      else
        answer_attrs = {
          question_id: question.id,
          variant_id: answer
        }
        @answer = ChoiceField.new(answer_attrs)
      end
      @answer.save
    end
    redirect_to respondent_root_path
  end
end
