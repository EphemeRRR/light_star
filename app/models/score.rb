class Score < ApplicationRecord
  belongs_to :super_category
  belongs_to :user
end
