class Web::WelcomeController < Web::ApplicationController
  def index
    @surveys = Survey.where(public: true).decorate
  end
end
