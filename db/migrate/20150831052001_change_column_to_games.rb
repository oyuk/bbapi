class ChangeColumnToGames < ActiveRecord::Migration
  def change
    change_column :games, :home_score, :string, null: true
    change_column :games, :away_score, :string, null: true
  end
end
