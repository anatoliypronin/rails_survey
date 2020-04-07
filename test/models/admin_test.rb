require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test "should create admin" do
    admin = create :admin
    created_admin = Admin.last
    assert created_admin
  end

  test "should email unic" do
    email = 'unic@test.ru'
    admin = create :admin, email: email
    admin2 = build :admin, email: email
    assert_not admin2.save
  end
end
