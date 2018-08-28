class SuperCategory < ApplicationRecord
  has_many :sub_categories, dependent: :destroy
  has_many :scores, dependent: :destroy
end
