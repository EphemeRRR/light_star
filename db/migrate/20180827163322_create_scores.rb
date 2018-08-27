class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.references :super_category, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :viewing_time_seconds

      t.timestamps
    end
  end
end
