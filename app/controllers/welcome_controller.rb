class WelcomeController < ApplicationController
  def index
    @surveys = Survey.where(public: true).decorate
  end
end
