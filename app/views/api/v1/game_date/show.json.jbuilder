json.array!(@game_date.games) do |game|
  json.home do
    json.team game.home
    json.score game.home_score
  end
  json.away do
    json.team game.away
    json.score game.away_score
  end
  json.result do
    json.score game.game_score
    json.win_pitcher game.win_pitcher
    json.save_pitcher game.save_pitcher
    json.lose_pitcher game.lose_pitcher
  end
end
