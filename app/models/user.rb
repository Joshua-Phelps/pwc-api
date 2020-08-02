class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true


  # permission levels
  # 1 => regular user, can create/update paintings and read everyething but admin page
  # 2 => Can create/update everything except permissions 
  # 3 => Owner, can create/update/delete everything

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.forgot_password(self).deliver_now # This sends an e-mail with a link for the user to reset the password
  end

# This generates a random password reset token for the user
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end 
end
