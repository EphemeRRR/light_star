class AddColumnChannelToVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :channel, :string
  end
end
