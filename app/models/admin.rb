class Admin < User
  has_secure_password

  validates :email,  presence: true,
                     uniqueness: { case_sensitive: false },
                     format: { with: /.*@.*/, message: "doesn't contein sym @" }
end
