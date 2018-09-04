class AddPhotoIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :photo_id, :string, default: 'pfodkurg3t9w40qnseqe'
  end
end
