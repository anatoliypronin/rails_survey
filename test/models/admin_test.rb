require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test "should create admin" do
    create :admin
    created_admin = Admin.last
    assert created_admin
  end

  test "should email unic" do
    email = 'unic@test.ru'
    create :admin, email: email
    admin = build :admin, email: email
    assert_not admin.save
  end

  test "should transite state to archived" do
    admin = create :admin
    admin.archived
    assert_equal  admin.state, 'archived'
  end
end
