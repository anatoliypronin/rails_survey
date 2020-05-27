class Api::V1::Answer::ChoicesController < Api::V1::ApplicationController
  def create
    choice = ChoiceField.new(choice_params)

    respond_to do |format|
      if choice.save
       format.json { render json: choice, status: :created, location: nil}
      else
       format.json { render json: choice.errors, status: :unprocessable_entity }
      end
    end
    # if choice.save
    #   respond_with(choice, location: nil)
    # else
    #   render(json: { errors: choice.errors.messages }, status: :unprocessable_entity)
    # end
    # # render json: questions, each_serializer: QuestionIndexSerializer
  end

  def choice_params
    params.require(:choiceField).permit(:question_id, :variant_id)
  end
end
