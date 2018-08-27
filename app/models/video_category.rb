class VideoCategory < ApplicationRecord
  belongs_to :video
  belongs_to :sub_category
end
