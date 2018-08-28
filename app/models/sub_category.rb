class SubCategory < ApplicationRecord
  belongs_to :SuperCategory
  has_many :video_categories, dependent: :destroy
end
