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

  def make_comment_timestamps
    self.comments = self.comments.each do |comment|
      comment.make_timestamp
    end
  end

  def un_integer_timestamps
  end

  def sort_comment_timestamps
    self.comments.sort do |a,b|
      a.timestamp <=> b.timestamp
    end
  end

  def untimestamp_comments
    self.comments.each do |comment|
      comment.un_timestamp
    end
  end

  def make_timestamps_integers
    self.comments = self.comments.each do |comment|
      comment.timestamp.to_i
    end
  end


end
