class Web::Respondent::WelcomeController < Web::Respondent::ApplicationController
  def index
    @surveys = Survey.where(public: true).decorate
  end
end

