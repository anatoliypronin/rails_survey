class Web::Respondent::WelcomeController < Web::Respondent::ApplicationController
  def index
    @surveys = Survey.where(public: true).decorate
  end

  def show
    @survey = Survey.find(params[:id])
  end
end
