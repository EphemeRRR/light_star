class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :youtube_id
      t.integer :duration_seconds
      t.string :difficulty

      t.timestamps
    end
  end
end
