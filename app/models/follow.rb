class Follow < ApplicationRecord
  belongs_to :user

  attr_reader :name

  def name
    User.find(self.follower_id)
  end


end
