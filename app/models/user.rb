class User < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follows, dependent: :destroy

  attr_reader :follower_names

  validates_uniqueness_of :name

  has_secure_password

  # def password=(plaintext_password)
  #   self.password_digest = BCrypt::Password.create(plaintext_password)
  # end
  #
  # def authenticate(plaintext_password)
  #   BCrypt::Password.new(self.password_digest) == plaintext_password
  # end

  def follower_names
    self.follows.map do |follow|
      User.find(follow.follower_id).name
    end
  end

  def following
    Follow.all.select {|follow| follow.follower_id == self.id}
  end


end
