User.create!(
  email: "test@example.com",
  password_digest: BCrypt::Password.create("password")
)
