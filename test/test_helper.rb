ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module SignInHelper
  def sign_in_as_admin(admin)
    post session_path, params: {
      user: {
        password: admin.password,
        email: admin.email
      }
    }
  end
end

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  include AuthHelper
  parallelize(workers: :number_of_processors)
end

class ActionDispatch::IntegrationTest
  include SignInHelper
end
