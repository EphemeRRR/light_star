class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :url
      t.references :sub_category, foreign_key: true

      t.timestamps
    end
  end
end
