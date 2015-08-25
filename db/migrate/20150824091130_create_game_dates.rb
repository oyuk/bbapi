class CreateGameDates < ActiveRecord::Migration
  def change
    create_table :game_dates do |t|

      t.date :game_date,null: false

      t.timestamps null: false
    end
  end
end
