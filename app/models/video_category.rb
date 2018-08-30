class VideoCategory < ApplicationRecord
  belongs_to :video
  belongs_to :sub_category

  validates :sub_category, uniqueness: { scope: :video }

end
