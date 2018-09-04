class AddColumnToSkillScore < ActiveRecord::Migration[5.2]
  def change
    add_column :skill_scores, :checked, :boolean
  end
end
