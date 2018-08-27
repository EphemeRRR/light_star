class CreateVideoCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :video_categories do |t|
      t.references :video, foreign_key: true
      t.references :sub_category, foreign_key: true
      t.integer :relevance

      t.timestamps
    end
  end
end
