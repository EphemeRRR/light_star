class AddColumnToHistorie < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :note, :text, default: ""
  end
end
