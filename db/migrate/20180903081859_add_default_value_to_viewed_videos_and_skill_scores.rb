class AddDefaultValueToViewedVideosAndSkillScores < ActiveRecord::Migration[5.2]
  def change
    change_column :skill_scores, :viewed_videos, :integer, default: 0
    change_column :skill_scores, :skill_score, :integer, default: 0
  end
end
