class Video < ApplicationRecord
  has_many :histories, dependent: :destroy
  has_many :video_categories, dependent: :destroy
  has_many :sub_categories, through: :video_categories

  validates :youtube_id, uniqueness: true, presence: true, format: { with: /\A.{11}\z/ }
  validates :minimum_age, presence: true

  include PgSearch

  pg_search_scope :global_search,
    against: [ :title ],
    associated_against: {
      sub_categories: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
