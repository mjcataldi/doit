require 'faker'

desired_users = 50
total_users = User.count

(desired_users - total_users).times do
  username = Faker::Internet.user_name
  email = Faker::Internet.safe_email(username)

  User.create(
    username: username,
    email: email,
    password: username,
    password_confirm: username
    )
end
