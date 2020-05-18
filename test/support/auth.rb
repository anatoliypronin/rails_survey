module Support
  module Auth
    def sign_in_as_admin(admin)
      post admin_session_path, params: {
        admin: {
          password: admin.password,
          email: admin.email
        }
      }
    end

    def sign_in_as_respondent(respondent)
      post respondent_session_path, params: {
        respondent: {
          phone: respondent.phone
        }
      }
    end
  end
end
