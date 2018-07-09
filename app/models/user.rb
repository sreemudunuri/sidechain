class User < ApplicationRecord
  has_many :songs
  has_many :comments, through: :songs
end
