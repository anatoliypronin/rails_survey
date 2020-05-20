class Web::Respondent::ApplicationController < Web::ApplicationController
  before_action :authenticate_respondent!
end
