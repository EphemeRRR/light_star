class AddDefaultValueToViewingTimeSeconds < ActiveRecord::Migration[5.2]
  def change
    change_column :scores, :viewing_time_seconds, :integer, default: 0
    change_column :skill_scores, :viewing_time_seconds, :integer, default: 0
  end
end
