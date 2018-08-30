class Video < ApplicationRecord
  has_many :histories, dependent: :destroy
  has_many :video_categories, dependent: :destroy
  validates :youtube_id, uniqueness: true, presence: true

end
