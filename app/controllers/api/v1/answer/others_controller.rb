class Api::V1::Answer::OthersController < Api::V1::ApplicationController
  def create
    other = OtherField.new(other_params)

    respond_to do |format|
      if other.save
       format.json { render json: other, status: :created, location: nil}
      else
       format.json { render json: other.errors, status: :unprocessable_entity }
      end
    end
  end

  def other_params
    params.require(:otherField).permit(:question_id, :title)
  end
end
