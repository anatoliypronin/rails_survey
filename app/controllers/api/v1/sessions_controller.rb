class Api::V1::SessionsController < Api::V1::ApplicationController
  def create
    return render json: { message: 'Bad params' }, status: :bad_request if params.blank? || params[:respondent].blank?

    sign_in_form = RespondentSignInForm.new(respondent_attrs)
    return render json: { message: 'Phone is empty' }, status: :bad_request if sign_in_form.invalid?

    if sign_in_form.sms_code.present?
      if sign_in_form.sms_code == session[:verification_code]
        user_sign_in(sign_in_form.respondent)
        render json: { message: 'Auth success' }, status: :ok
      else
        render json: { message: 'incorrect sms code' }, status: :unprocessable_entity
      end
    elsif sign_in_form.respondent.present?
      code = SmsService.send_sms_code(sign_in_form.phone)
      session[:verification_code] = code

      render json: { message: 'Sms sent' }, status: :ok

    else
      render json: { message: 'Client has not found' }, status: :not_found
    end
  end

  private

  def respondent_attrs
    params.require(:respondent).permit(:phone, :sms_code)
  end
end
