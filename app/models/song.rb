class Song < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :song_file


  def song_url
    rails_blob_path(self.song_file, disposition: "attachment", only_path: true)
  end



end
