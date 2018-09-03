class AddInterestScoresToScores < ActiveRecord::Migration[5.2]
  def change
    add_column :scores, :interest_score, :integer, default: 0
  end
end
