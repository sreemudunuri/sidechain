class Song < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_many :comments, dependent: :destroy


  has_one_attached :song_file
  has_one_attached :image_file

  accepts_nested_attributes_for :comments

  def song_url
    rails_blob_path(self.song_file, disposition: "attachment", only_path: true)
  end

  def image_url
    rails_blob_path(self.image_file, disposition: "attachment", only_path: true)
  end



end
