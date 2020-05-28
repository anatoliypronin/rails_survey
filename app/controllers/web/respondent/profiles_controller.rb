class Web::Respondent::ProfilesController < Web::Respondent::ApplicationController
  def show
    @respondent = current_user
  end

  def edit
    @respondent = current_user
  end

  def update
    @respondent = current_user
    respondent_attrs = send("respondent_attrs")
    if @respondent.update(respondent_attrs)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def respondent_attrs
    params.require(:respondent).permit(:first_name, :last_name, :phone)
  end
end
