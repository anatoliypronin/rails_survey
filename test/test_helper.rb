ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  include FactoryBot::Syntax::Methods
  parallelize(workers: :number_of_processors)

end
