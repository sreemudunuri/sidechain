class Comment < ApplicationRecord
  belongs_to :song
  belongs_to :user

  validates :timestamp, presence: true, format: { with: /[0-9][0-9]:[0-9][0-9]/, message: "Please enter a timestamp in this format: [00:00]"}
  validates :content, presence: true

  def make_timestamp
    self.timestamp = self.timestamp.split(":").join("")
  end

  def un_timestamp
    self.timestamp.to_s
    if self.timestamp.length == 2
      self.timestamp = "00:" + self.timestamp
    elsif self.timestamp.length == 3
      self.timestamp = "0" + self.timestamp[0] + ":" + self.timestamp[1..2]
    elsif self.timestamp.length == 4
      self.timestamp = self.timestamp[0..1] + ":" + self.timestamp[2..3]
    end
  end

end
