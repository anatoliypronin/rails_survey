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
          type: "OtherField",
          title: answer,
        }
        @answer = Answer.new(answer_attrs)
        @answer.save
      else
        answer_attrs = {
          question_id: question.id,
          type: "ChoiceField",
          variant_id: answer,
        } 
        @answer = Answer.new(answer_attrs)
        @answer.save
      end
    end
    redirect_to respondent_root_path
  end
end
