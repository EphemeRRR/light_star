class AddViewingTimeSecondsToSkillScores < ActiveRecord::Migration[5.2]
  def change
    add_column :skill_scores, :viewing_time_seconds, :integer
  end
end
