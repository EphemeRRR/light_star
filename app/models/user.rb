class User < ApplicationRecord
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
end
