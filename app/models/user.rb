class User < ApplicationRecord
  after_create :create_scores
  extend FriendlyId
  friendly_id :username, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # No slashes or whitespaces allowed in username
  validates :username, uniqueness: true, format: { :without => /[(\/|\s|\\)]/,
    message: 'Your username cannot contain any spaces or slashes.' }

  has_many :histories, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_many :skill_scores, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :sub_categories, through: :skill_scores

  mount_uploader :photo_id, PhotoUploader

  private

  def create_scores
    sub_categories = SubCategory.all
    sub_categories.each do |subcategory|
      SkillScore.create(sub_category: subcategory, user: self)
    end
  end
end
