class RenameBallParkColumnToGames < ActiveRecord::Migration
  def change
    rename_column :games, :ballPark, :ball_park
  end
end
