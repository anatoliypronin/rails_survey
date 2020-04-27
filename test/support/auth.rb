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
  end
end
