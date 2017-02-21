class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 3}
  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end

  def self.authenticate_with_credentials(email, password)
    email_format = email.split.join("").downcase

    user = User.find_by_email(email_format)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
