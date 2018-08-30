class AddDefaultValueToViewedVideos < ActiveRecord::Migration[5.2]
  def change
    change_column :scores, :viewed_videos, :integer, default: 0
  end
end
