require 'bcrypt'

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validate :confirm_password_valid

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def password_confirm=(password_confirm)
    @password_confirm = password_confirm
  end

  def confirm_password_valid
    errors.add(:password_confirmation, "- Try again, passwords did not match.") unless @raw_password == @password_confirm
  end
end
