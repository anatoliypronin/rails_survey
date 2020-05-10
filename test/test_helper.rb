require 'coveralls'
Coveralls.wear!

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

Dir[Rails.root.join('test/support/**/*.rb')].sort.each { |f| require f }

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  include AuthHelper
  # parallelize(workers: :number_of_processors)
  parallelize(workers: 1)
end

class ActionDispatch::IntegrationTest
  include Support::Auth
end
