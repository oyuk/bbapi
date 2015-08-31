class ChangeColumnToGame < ActiveRecord::Migration
  # 変更内容
    def change
      change_column :games, :home_score, :integer, null: true
      change_column :games, :away_score, :integer, null: true
      change_column :games, :win_pitcher, :string, null: true
      change_column :games, :save_pitcher, :string, null: true
      change_column :games, :lose_pitcher, :string, null: true
      change_column :games, :game_score, :string, null:true
    end
end
