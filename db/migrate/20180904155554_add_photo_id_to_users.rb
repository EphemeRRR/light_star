class AddPhotoIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :photo_id, :string,
    default: 'image/upload/v1536080431/tc91qgpwedo6dhey8w0t.png'
  end
end
