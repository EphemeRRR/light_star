class CreateSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.references :super_category, foreign_key: true

      t.timestamps
    end
  end
end