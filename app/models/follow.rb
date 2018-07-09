class Follow < ApplicationRecord
  belongs_to :user

  @@followers = []

  def follower_id=(id)
    @follower = User.find(id)
    @@followers << @follower
  end

  def self.followers
    @@followers
  end
  
end
