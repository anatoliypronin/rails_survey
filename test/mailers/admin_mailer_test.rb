require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  test 'admin welcome_email' do
    admin = create :admin
    email = AdminMailer.welcome_email(admin)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [admin.email], email.to
  end
end
