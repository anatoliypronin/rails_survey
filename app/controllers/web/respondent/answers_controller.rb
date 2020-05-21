class Web::Respondent::AnswersController < Web::Respondent::ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @questions = @survey.questions
  end

  def create
    answers = params[:answers]
    p answers
    answers.each do |question_id, answer| 
      q = Questiion.find(question_id)
      
      puts "#{question_id} is #{answer}" 
    end
    redirect_to root_path
  end
end
