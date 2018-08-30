class AddViewedVideosToScores < ActiveRecord::Migration[5.2]
  def change
    add_column :scores, :viewed_videos, :integer
  end
end
