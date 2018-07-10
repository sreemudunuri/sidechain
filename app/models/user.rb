class User < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follows, dependent: :destroy

  attr_reader :follower_names

  def follower_names
    self.follows.map do |follow|
      User.find(follow.follower_id).name
    end
  end

end
