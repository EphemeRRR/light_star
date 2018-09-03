class CreateSkillScores < ActiveRecord::Migration[5.2]
  def change
    create_table :skill_scores do |t|
      t.references :sub_category, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :viewed_videos
      t.integer :skill_score

      t.timestamps
    end
  end
end
