module Support
  module Auth
    def sign_in_as_admin(admin)
      post session_path, params: {
        user: {
          password: admin.password,
          email: admin.email
        }
      }
    end
  end
end
