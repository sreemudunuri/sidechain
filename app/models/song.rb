class Song < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_one_attached :song_file
end
