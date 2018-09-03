class SubCategory < ApplicationRecord
  belongs_to :super_category
  has_many :video_categories, dependent: :destroy
  has_many :skill_scores, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
