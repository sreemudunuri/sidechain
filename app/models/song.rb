class Song < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all


  has_one_attached :song_file
end
