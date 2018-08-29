class SubCategory < ApplicationRecord
  belongs_to :super_category
  has_many :video_categories, dependent: :destroy
end
