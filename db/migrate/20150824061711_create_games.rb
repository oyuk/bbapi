class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.string :home, null: false
      t.string :away , null: false
      t.string :start_time, null: false
      t.string :ballPark, null: false
      t.integer :home_score, null: false
      t.integer :away_score, null: false
      t.string :inning, null: false
      t.string :win_pitcher, null: false
      t.string :save_pitcher, null: false
      t.string :lose_pitcher, null: false
      t.integer :game_date_id, null: false

      t.timestamps null: false
    end
  end
end
