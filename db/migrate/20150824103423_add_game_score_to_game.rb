class AddGameScoreToGame < ActiveRecord::Migration
  def change
    add_column :games, :game_score, :string
  end
end
