class AddColumnToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :verified, :boolean
    add_column :videos, :pro, :boolean
    add_column :videos, :introduction, :boolean
  end
end
