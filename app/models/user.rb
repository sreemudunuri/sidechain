class User < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates_uniqueness_of :name

  has_secure_password

  # def password=(plaintext_password)
  #   self.password_digest = BCrypt::Password.create(plaintext_password)
  # end
  #
  # def authenticate(plaintext_password)
  #   BCrypt::Password.new(self.password_digest) == plaintext_password
  # end

end
