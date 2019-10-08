class User < ApplicationRecord
  has_secure_password

  validates :name,
            presence: true,
            length: { maximum: 50 }
  
  validates :password,
            presence: true,
            length: { minimum: 8 }

  validates :email,
            presence: true,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: { case_sensitive: false },
            length: { maximum: 260}

  before_save { self.email = email.downcase }

end
