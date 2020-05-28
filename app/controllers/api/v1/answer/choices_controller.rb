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
  end

  def choice_params
    params.require(:choiceField).permit(:question_id, :variant_id)
  end
end
